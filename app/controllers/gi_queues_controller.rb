class GiQueuesController < ApplicationController
  require "bio"
  # GET /add_gis_to_queue.json
  def add_gis_to_queue
    @gis = params[:gis]
    subdb = params[:subdb]

    @gi_already_fetched = Bio::SQL::Bioentry.select(:identifier).where(identifier: @gis).map {|g| g.identifier}
    @gi_already_in_queue = GiQueue.select(:gi).where(gi: @gis).map {|g| g.gi}

    @gis_to_add = ( Set.new(@gis) - ( Set.new(@gi_alread_fetched) + Set.new(@gi_already_in_queue) ) ).to_a
    
    @gis_to_add.each do |gi|
      GiQueue.create(gi: gi)
    end
    respond_to do |format|
      format.json { render json: @gis_to_add }
    end
  end
end
