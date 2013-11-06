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
    if params[:ncbi_taxon_id]
      @taxon = TaxonWithName.find_by_ncbi_taxon_id(params[:ncbi_taxon_id])
    elsif params[:name]
      @taxon = TaxonWithName.from_synonym(params[:name])
    end
    @hierarchy = @taxon.all_up_to_root
    respond_to do |format|
      format.json {render json: @hierarchy }
    end      
  end
  # GET /ncbi_taxon_ids2full_taxon_hierarchies
  def ncbi_taxon_ids2full_taxon_hierarchies
    if params[:ncbi_taxon_ids]
      @taxons = TaxonWithName.where(ncbi_taxon_id: params[:ncbi_taxon_ids])
#    elsif params[:name]
#      @taxon = TaxonWithName.from_synonym(params[:name])
    end
    @hierarchies = []
    @taxons.each do |taxon|
      @hierarchies << taxon.all_up_to_root
    end  
    respond_to do |format|
      format.json {render json: @hierarchies }
    end      
  end
  # GET /organism_group_name2full_taxon_hierarchies/?name=nnn
  def organism_group_name2full_taxon_hierarchies
    @organism_group = OrganismGroup.find_by_name(params[:name])
    ncbi_taxons = @organism_group.organism_group_rows.map {|o| o.ncbi_taxon_id}
    @taxons = TaxonWithName.where(ncbi_taxon_id: ncbi_taxons)
    @hierarchies = []
    @taxons.each do |taxon|
      @hierarchies << taxon.all_up_to_root
    end
    respond_to do |format|
      format.json { render json: @hierarchies }
    end
  end

  # GET /gis2taxa
  def gis2taxa
    @protein_gis_taxons = ProteinGiTaxon.where(protein_gi: Set.new(params[:gis]))
    ncbi_taxons = Set.new(@protein_gis_taxons.map { |p| p["taxon_id"]})
    @taxons = TaxonWithName.where(ncbi_taxon_id: ncbi_taxons)
    @hierarchies = []
    @taxons.each do |taxon|
      @hierarchies << taxon.all_up_to_root
    end
    respond_to do |format|
      format.json { render json: @hierarchies }
    end

  end
end
