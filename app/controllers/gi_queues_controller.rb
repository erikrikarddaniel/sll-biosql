class GiQueuesController < ApplicationController
  # GET /add_gis_to_queue.json
  def add_gis_to_queue
    @gis = Set.new(params[:gis])
    @db = Biodatabase.find(:first, conditions: {name: params[:subdb]})
    
    @gi_already_processed = Set.new(Bioentry.where(biodatabase_id: @db.id).all.map {|p| p.protein_gi}) + Set.new(GiQueue.all.map {|g| g.gi})
    @gis_to_add = @gis - @gi_already_processed
    @gis_to_add.each do |gi|
      GiQueue.create(gi)
    end
    respond_to do |format|
      format.json { render json: @gis_to_add }
    end
  end
end
