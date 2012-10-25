class TaxonAttributesController < ApplicationController
  # GET /taxon_attributes
  # GET /taxon_attributes.json
  def index
    @taxon_attributes = TaxonAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxon_attributes }
    end
  end

  # GET /taxon_attributes/1
  # GET /taxon_attributes/1.json
  def show
    @taxon_attribute = TaxonAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxon_attribute }
    end
  end

  # GET /taxon_attributes/new
  # GET /taxon_attributes/new.json
  def new
    @taxon_attribute = TaxonAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxon_attribute }
    end
  end

  # GET /taxon_attributes/1/edit
  def edit
    @taxon_attribute = TaxonAttribute.find(params[:id])
  end

  # POST /taxon_attributes
  # POST /taxon_attributes.json
  def create
    @taxon_attribute = TaxonAttribute.new(params[:taxon_attribute])

    respond_to do |format|
      if @taxon_attribute.save
        format.html { redirect_to @taxon_attribute, notice: 'Taxon attribute was successfully created.' }
        format.json { render json: @taxon_attribute, status: :created, location: @taxon_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @taxon_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxon_attributes/1
  # PUT /taxon_attributes/1.json
  def update
    @taxon_attribute = TaxonAttribute.find(params[:id])

    respond_to do |format|
      if @taxon_attribute.update_attributes(params[:taxon_attribute])
        format.html { redirect_to @taxon_attribute, notice: 'Taxon attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @taxon_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxon_attributes/1
  # DELETE /taxon_attributes/1.json
  def destroy
    @taxon_attribute = TaxonAttribute.find(params[:id])
    @taxon_attribute.destroy

    respond_to do |format|
      format.html { redirect_to taxon_attributes_url }
      format.json { head :no_content }
    end
  end
end
