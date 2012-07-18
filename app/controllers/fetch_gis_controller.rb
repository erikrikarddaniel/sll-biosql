class FetchGisController < ApplicationController
  # GET /fetch_gis
  # GET /fetch_gis.json
  def index
    gis_hashes = params["gis"]
    @getch_gis = []
    gis_hashes.each do |gi_hash|
      
      @fetch_gis << ProteinGiTaxon.find(:first, :conditions => ["gi = ?", gi_hash["gi"]])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fetch_gis }
    end
  end

  # GET /fetch_gis/1
  # GET /fetch_gis/1.json
  def show
    @fetch_gi = FetchGi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fetch_gi }
    end
  end

  # GET /fetch_gis/new
  # GET /fetch_gis/new.json
  def new
    @fetch_gi = FetchGi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fetch_gi }
    end
  end

  # GET /fetch_gis/1/edit
  def edit
    @fetch_gi = FetchGi.find(params[:id])
  end

  # POST /fetch_gis
  # POST /fetch_gis.json
  def create
    @fetch_gi = FetchGi.new(params[:fetch_gi])

    respond_to do |format|
      if @fetch_gi.save
        format.html { redirect_to @fetch_gi, notice: 'Fetch gi was successfully created.' }
        format.json { render json: @fetch_gi, status: :created, location: @fetch_gi }
      else
        format.html { render action: "new" }
        format.json { render json: @fetch_gi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fetch_gis/1
  # PUT /fetch_gis/1.json
  def update
    @fetch_gi = FetchGi.find(params[:id])

    respond_to do |format|
      if @fetch_gi.update_attributes(params[:fetch_gi])
        format.html { redirect_to @fetch_gi, notice: 'Fetch gi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fetch_gi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fetch_gis/1
  # DELETE /fetch_gis/1.json
  def destroy
    @fetch_gi = FetchGi.find(params[:id])
    @fetch_gi.destroy

    respond_to do |format|
      format.html { redirect_to fetch_gis_url }
      format.json { head :no_content }
    end
  end
end
