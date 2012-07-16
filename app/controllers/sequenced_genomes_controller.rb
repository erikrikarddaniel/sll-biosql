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

  def all_with_taxon_hierarchy
    @sequenced_genomes = SequencedGenome.all
    @sequenced_genomes.each do |gen|
      gen
  end
end
