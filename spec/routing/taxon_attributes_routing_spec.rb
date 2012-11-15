require "spec_helper"

describe TaxonAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/taxon_attributes").should route_to("taxon_attributes#index")
    end

    it "routes to #new" do
      get("/taxon_attributes/new").should route_to("taxon_attributes#new")
    end

    it "routes to #show" do
      get("/taxon_attributes/1").should route_to("taxon_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/taxon_attributes/1/edit").should route_to("taxon_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/taxon_attributes").should route_to("taxon_attributes#create")
    end

    it "routes to #update" do
      put("/taxon_attributes/1").should route_to("taxon_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/taxon_attributes/1").should route_to("taxon_attributes#destroy", :id => "1")
    end

  end
end
