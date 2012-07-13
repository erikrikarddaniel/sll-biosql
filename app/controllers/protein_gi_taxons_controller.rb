class ProteinGiTaxonsController < ApplicationController
  # GET /protein_gi_taxons
  # GET /protein_gi_taxons.json
  def index
    @protein_gi_taxons = ProteinGiTaxon.all

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

  # GET /protein_gi_taxons/new
  # GET /protein_gi_taxons/new.json
  def new
    @protein_gi_taxon = ProteinGiTaxon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @protein_gi_taxon }
    end
  end

  # GET /protein_gi_taxons/1/edit
  def edit
    @protein_gi_taxon = ProteinGiTaxon.find(params[:id])
  end

  # POST /protein_gi_taxons
  # POST /protein_gi_taxons.json
  def create
    @protein_gi_taxon = ProteinGiTaxon.new(params[:protein_gi_taxon])

    respond_to do |format|
      if @protein_gi_taxon.save
        format.html { redirect_to @protein_gi_taxon, notice: 'Protein gi taxon was successfully created.' }
        format.json { render json: @protein_gi_taxon, status: :created, location: @protein_gi_taxon }
      else
        format.html { render action: "new" }
        format.json { render json: @protein_gi_taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /protein_gi_taxons/1
  # PUT /protein_gi_taxons/1.json
  def update
    @protein_gi_taxon = ProteinGiTaxon.find(params[:id])

    respond_to do |format|
      if @protein_gi_taxon.update_attributes(params[:protein_gi_taxon])
        format.html { redirect_to @protein_gi_taxon, notice: 'Protein gi taxon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @protein_gi_taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protein_gi_taxons/1
  # DELETE /protein_gi_taxons/1.json
  def destroy
    @protein_gi_taxon = ProteinGiTaxon.find(params[:id])
    @protein_gi_taxon.destroy

    respond_to do |format|
      format.html { redirect_to protein_gi_taxons_url }
      format.json { head :no_content }
    end
  end
end
