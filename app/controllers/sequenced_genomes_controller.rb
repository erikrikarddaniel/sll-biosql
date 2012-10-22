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

  def all_with_taxa_hierarchy
    @all_hierarchies = SequencedGenome.all_taxa_with_ancestors
    respond_to do |format|
      format.json { render json: @all_hierarchies }
    end
  end

  def all_with_taxa_hierarchy_test
    @all_hierarchies = SequencedGenome.all_taxa_with_ancestors_test
    respond_to do |format|
      format.json { render json: @all_hierarchies }
    end
  end

  def all_ids
    @all = SequencedGenome.all
    @all_ids = @all.map(&:id)
    respond_to do |format|
      format.json { render json: @all_ids }
    end
  end

  def taxon_with_ancestors
    @taxon = SequencedGenome.find(params[:id])
    @hierarchy = @taxon.taxon_with_name.all_up_to_root
    respond_to do |format|
      format.json {render json: @hierarchy }
    end
end
