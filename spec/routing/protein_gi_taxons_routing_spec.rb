require "spec_helper"

describe ProteinGiTaxonsController do
  describe "routing" do

    it "routes to #index" do
      get("/protein_gi_taxons").should route_to("protein_gi_taxons#index")
    end

    it "routes to #new" do
      get("/protein_gi_taxons/new").should route_to("protein_gi_taxons#new")
    end

    it "routes to #show" do
      get("/protein_gi_taxons/1").should route_to("protein_gi_taxons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/protein_gi_taxons/1/edit").should route_to("protein_gi_taxons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/protein_gi_taxons").should route_to("protein_gi_taxons#create")
    end

    it "routes to #update" do
      put("/protein_gi_taxons/1").should route_to("protein_gi_taxons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/protein_gi_taxons/1").should route_to("protein_gi_taxons#destroy", :id => "1")
    end

  end
end
