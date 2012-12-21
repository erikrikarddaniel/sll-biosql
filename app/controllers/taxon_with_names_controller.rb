class TaxonWithNamesController < ApplicationController
  def index
    if params[:ncbi_taxon_id]
      @taxon_with_names = TaxonWithName.find_all_by_ncbi_taxon_id(params[:ncbi_taxon_id])
    else
      @taxon_with_names = TaxonWithName.all(:limit => 1000)
    end

    respond_to do |format|
      format.html
      format.json { render json: @taxon_with_names }
    end
  end

  # GET /taxon_with_names/1
  # GET /taxon_with_names/1.json
  def show
    @taxon_with_name = TaxonWithName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxon_with_name }
    end
  end

  # GET /taxon_hierarchy/1
  # GET /taxon_hierarchy/1.json
  def nn
  end

  # GET /ncbi_taxon_id2full_taxon_hierarchy
  def ncbi_taxon_id2full_taxon_hierarchy
    @taxon = TaxonWithName.find_by_ncbi_taxon_id(params[:ncbi_taxon_id])
    @hierarchy = @taxon.all_up_to_root
    respond_to do |format|
      format.json {render json: @hierarchy }
    end      
  end
end
