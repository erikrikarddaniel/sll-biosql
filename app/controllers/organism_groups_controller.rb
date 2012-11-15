class OrganismGroupsController < ApplicationController
  # GET /organism_groups
  # GET /organism_groups.json
  def index
    @organism_groups = OrganismGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organism_groups }
    end
  end

  # GET /organism_groups/1
  # GET /organism_groups/1.json
  def show
    @organism_group = OrganismGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { _json }
    end
  end

  # GET /organism_group_by_name/?name=nnn
  def show_by_name
    @organism_group = OrganismGroup.find_by_name(params[:name])

    respond_to do |format|
      format.html { render :show }
      format.json { _json }
      #format.json { render json: { :organism_group => @organism_group, :ncbi_taxon_ids => @organism_group.organism_group_rows.map { |ogr| ogr.ncbi_taxon_id } } }
    end
  end

  # GET /organism_groups/new
  # GET /organism_groups/new.json
  def new
    @organism_group = OrganismGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organism_group }
    end
  end

  # GET /organism_groups/1/edit
  def edit
    @organism_group = OrganismGroup.find(params[:id])
  end

  # POST /organism_groups
  # POST /organism_groups.json
  def create
    @organism_group = OrganismGroup.new(params[:organism_group])

    respond_to do |format|
      if @organism_group.save
        format.html { redirect_to @organism_group, notice: 'Organism group was successfully created.' }
        format.json { render json: @organism_group, status: :created, location: @organism_group }
      else
        format.html { render action: "new" }
        format.json { render json: @organism_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organism_groups/1
  # PUT /organism_groups/1.json
  def update
    @organism_group = OrganismGroup.find(params[:id])

    respond_to do |format|
      if @organism_group.update_attributes(params[:organism_group])
        format.html { redirect_to @organism_group, notice: 'Organism group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organism_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organism_groups/1
  # DELETE /organism_groups/1.json
  def destroy
    @organism_group = OrganismGroup.find(params[:id])
    @organism_group.destroy

    respond_to do |format|
      format.html { redirect_to organism_groups_url }
      format.json { head :no_content }
    end
  end

private

  def _json
    #render json: { :name => @organism_group.name, :ncbi_taxon_ids => @organism_group.organism_group_rows.map { |ogr| ogr.ncbi_taxon_id } }
    #render json: { group: @organism_group, ncbi_taxon_ids: @organism_group.organism_group_rows.map { |ogr| ogr.ncbi_taxon_id } }
    render json: @organism_group.to_json(:include => :organism_group_rows)
  end
end
