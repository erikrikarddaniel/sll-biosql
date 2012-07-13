require 'spec_helper'

describe "ProteinGiTaxons" do
  describe "GET /protein_gi_taxons" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get protein_gi_taxons_path
      response.status.should be(200)
    end
  end
end
