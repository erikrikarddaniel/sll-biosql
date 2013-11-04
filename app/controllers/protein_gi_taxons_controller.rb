class ProteinGiTaxonsController < ApplicationController
  # GET /protein_gi_taxons
  # GET /protein_gi_taxons.json
  def index
    @protein_gi_taxons = []

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @protein_gi_taxons }
    end
  end

  # GET /protein_gi_taxons/1
  # GET /protein_gi_taxons/1.json
  def show
    @protein_gi_taxon = ProteinGiTaxon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @protein_gi_taxon }
    end
  end
  
  # GET /gi2ncbi_taxon_id.json
  def gi2ncbi_taxon_id
    @protein_gi_taxon = ProteinGiTaxon.find(params[:gi])
    respond_to do |format|
      format.json { render json: @protein_gi_taxon }
    end
  end

  # GET /gis2ncbi_taxon_ids.json
  def gis2ncbi_taxon_ids
    @protein_gis_taxons = ProteinGiTaxon.find(params[:gis])
    respond_to do |format|
      format.json { render json: @protein_gis_taxons }
    end
  end
end
