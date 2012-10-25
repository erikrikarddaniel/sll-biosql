require "spec_helper"

describe OrganismGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/organism_groups").should route_to("organism_groups#index")
    end

    it "routes to #new" do
      get("/organism_groups/new").should route_to("organism_groups#new")
    end

    it "routes to #show" do
      get("/organism_groups/1").should route_to("organism_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/organism_groups/1/edit").should route_to("organism_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/organism_groups").should route_to("organism_groups#create")
    end

    it "routes to #update" do
      put("/organism_groups/1").should route_to("organism_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/organism_groups/1").should route_to("organism_groups#destroy", :id => "1")
    end

  end
end
