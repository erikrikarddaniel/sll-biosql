require "spec_helper"

describe OrganismGroupRowsController do
  describe "routing" do

    it "routes to #index" do
      get("/organism_group_rows").should route_to("organism_group_rows#index")
    end

    it "routes to #new" do
      get("/organism_group_rows/new").should route_to("organism_group_rows#new")
    end

    it "routes to #show" do
      get("/organism_group_rows/1").should route_to("organism_group_rows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/organism_group_rows/1/edit").should route_to("organism_group_rows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/organism_group_rows").should route_to("organism_group_rows#create")
    end

    it "routes to #update" do
      put("/organism_group_rows/1").should route_to("organism_group_rows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/organism_group_rows/1").should route_to("organism_group_rows#destroy", :id => "1")
    end

  end
end
