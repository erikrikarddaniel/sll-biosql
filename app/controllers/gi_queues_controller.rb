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
      format.all { render_404 }
    end
  end

  def get_gis_sequences
    
    @gis = params[:gis]
    seqs = []
    entries = Bio::SQL::Bioentry.where(identifier: @gis)
    entries.each do |entry|
      sequence = Bio::SQL.fetch_accession(entry.accession)
      seqs << sequence
    end
    respond_to do |format|
      format.json { render json: seqs.map{|seq| {gi: seq.identifier, seq: seq.seq}} }
      format.gb { send_data(seqs.map{|seq| seq.to_biosequence.output(:genbank)}.join(""), filename: "pfitmap.gb") }
      format.fasta {  send_data(seqs.map{|seq| seq.to_biosequence.to_fasta("gi|#{seq.identifier}|#{seq.entry.bioentry_qualifier_values.where(term_id: 36).first.value}|#{seq.name}.#{seq.version}|#{seq.description}",60)}.join(""), filename: "pfitmap.fasta") }
      format.all { render_404  }
    end
  end
end
