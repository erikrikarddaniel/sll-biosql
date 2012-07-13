require "spec_helper"

describe FetchGisController do
  describe "routing" do

    it "routes to #index" do
      get("/fetch_gis").should route_to("fetch_gis#index")
    end

    it "routes to #new" do
      get("/fetch_gis/new").should route_to("fetch_gis#new")
    end

    it "routes to #show" do
      get("/fetch_gis/1").should route_to("fetch_gis#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fetch_gis/1/edit").should route_to("fetch_gis#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fetch_gis").should route_to("fetch_gis#create")
    end

    it "routes to #update" do
      put("/fetch_gis/1").should route_to("fetch_gis#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fetch_gis/1").should route_to("fetch_gis#destroy", :id => "1")
    end

  end
end
