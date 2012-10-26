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

  # GET /ncbi_taxon_id2full_taxon_hierarchy
  def ncbi_taxon_id2full_taxon_hierarchy
    @taxon = SequencedGenome.find(params[:ncbi_taxon_id])
    @hierarchy = @taxon.taxon_with_name.all_up_to_root
    respond_to do |format|
      format.json {render json: @hierarchy }
    end      
  end
end
