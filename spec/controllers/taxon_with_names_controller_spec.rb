require 'spec_helper'

describe TaxonWithNamesController do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FunctionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end
  
  describe "GET ncbi_taxon_id2full_taxon_hierarchy" do
    it "returns a json representation of a taxons full hierarchy" do
      get :ncbi_taxon_id2full_taxon_hierarchy, { ncbi_taxon_id: 83334, format: 'json' }, valid_session
      response.should be_success
      entries = JSON.parse(response.body)
      entries.length.should == 10
      entries[0]['scientific_name'].should == 'Escherichia coli O157:H7'
      entries[1]['scientific_name'].should == 'Escherichia coli'
      entries[2]['scientific_name'].should == 'Escherichia'
      entries[3]['scientific_name'].should == 'Enterobacteriaceae'
    end
  end
end
