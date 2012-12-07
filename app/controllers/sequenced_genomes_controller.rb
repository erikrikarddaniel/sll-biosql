class SequencedGenomesController < ApplicationController
  def index
    @sequenced_genomes = SequencedGenome.all

    respond_to do |format|
      format.html
      format.json { render json: @sequenced_genomes }
    end
  end

  # GET /sequenced_genomes/1
  # GET /sequenced_genomes/1.json
  def show
    @sequenced_genome = SequencedGenome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sequenced_genome }
    end
  end

  def all_ncbi_taxon_ids
    @all = SequencedGenome.all
    @all_ids = @all.map(&:ncbi_taxon_id)
    respond_to do |format|
      format.json { render json: @all_ids }
    end
  end
end
