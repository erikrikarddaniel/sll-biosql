class GiQueuesController < ApplicationController
  require "bio"
  GB_FILES = Rails.root.to_s + "/genbank_files/"
  # GET /add_gis_to_queue.json
  def add_gis_to_queue
    @gis = params[:gis]
    @gi_already_fetched = Bio::SQL::Bioentry.select(:identifier).where(identifier: @gis).map {|g| g.identifier}
    @gi_already_in_queue = GiQueue.select(:gi).where(gi: @gis).map {|g| g.gi}

    @gis_to_add = ( Set.new(@gis) - ( Set.new(@gi_alread_fetched) + Set.new(@gi_already_in_queue) ) ).to_a
    @gis_to_create = []
    @gis_to_add.each do |gi|
      @gis_to_create << GiQueue.new(gi: gi)
    end
    GiQueue.import @gis_to_create
    respond_to do |format|
      format.json { render json: @gis_to_add }
    end
  end

  def get_gis_sequences_fasta
    @gis = params[:gis]
    fasta = []
    entries = Bio::SQL::Bioentry.where(identifier: @gis)
    entries.each do |entry|
      sequence = Bio::SQL.fetch_accession(entry.accession)
      fasta << sequence.to_biosequence.to_fasta("gi|#{sequence.identifier}|#{sequence.entry.bioentry_qualifier_values.where(term_id: 36).first.value}|#{sequence.name}.#{sequence.version}|#{sequence.description}",60)
    end
    send_data(ActiveSupport::Gzip.compress(fasta.join("")), filename: "pfitmap.fasta.gz") 
  end
  def get_gis_sequences_gb
   @gis = params[:gis]
   gb = []
   not_found = []
   @gis.each do |g|
    f = GB_FILES+g+".gb.gz"
    if File.exists? f
      gb << ActiveSupport::Gzip.decompress(IO.read(f))
    else
      Rails.logger.warn "GI #{g} not found in gb"
    end
   end

   send_data(ActiveSupport::Gzip.compress(gb.join("")), filename: "pfitmap.gb.gz") 
  end
end
