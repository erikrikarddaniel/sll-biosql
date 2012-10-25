class OrganismGroupRowsController < ApplicationController
  # GET /organism_group_rows
  # GET /organism_group_rows.json
  def index
    @organism_group_rows = OrganismGroupRow.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organism_group_rows }
    end
  end

  # GET /organism_group_rows/1
  # GET /organism_group_rows/1.json
  def show
    @organism_group_row = OrganismGroupRow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organism_group_row }
    end
  end

  # GET /organism_group_rows/new
  # GET /organism_group_rows/new.json
  def new
    @organism_group_row = OrganismGroupRow.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organism_group_row }
    end
  end

  # GET /organism_group_rows/1/edit
  def edit
    @organism_group_row = OrganismGroupRow.find(params[:id])
  end

  # POST /organism_group_rows
  # POST /organism_group_rows.json
  def create
    @organism_group_row = OrganismGroupRow.new(params[:organism_group_row])

    respond_to do |format|
      if @organism_group_row.save
        format.html { redirect_to @organism_group_row, notice: 'Organism group row was successfully created.' }
        format.json { render json: @organism_group_row, status: :created, location: @organism_group_row }
      else
        format.html { render action: "new" }
        format.json { render json: @organism_group_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organism_group_rows/1
  # PUT /organism_group_rows/1.json
  def update
    @organism_group_row = OrganismGroupRow.find(params[:id])

    respond_to do |format|
      if @organism_group_row.update_attributes(params[:organism_group_row])
        format.html { redirect_to @organism_group_row, notice: 'Organism group row was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organism_group_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organism_group_rows/1
  # DELETE /organism_group_rows/1.json
  def destroy
    @organism_group_row = OrganismGroupRow.find(params[:id])
    @organism_group_row.destroy

    respond_to do |format|
      format.html { redirect_to organism_group_rows_url }
      format.json { head :no_content }
    end
  end
end
