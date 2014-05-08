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

  describe "GET ncbi_taxon_ids2full_taxon_hierarchies" do
    it "returns a list of json representations of taxons full hierarchies" do
      get :ncbi_taxon_ids2full_taxon_hierarchies, { ncbi_taxon_ids: [83334,63221], format: 'json' }, valid_session
      response.should be_success
      entries = JSON.parse(response.body)
      entries.should be_a(Array)
      entries.length.should == 2
      entries_first = entries[0]
      entries_second = entries[1]
      entries_first[0]['scientific_name'].should == 'Escherichia coli O157:H7'
      entries_first[1]['scientific_name'].should == 'Escherichia coli'
      entries_first[2]['scientific_name'].should == 'Escherichia'
      entries_first[3]['scientific_name'].should == 'Enterobacteriaceae'
      entries_second[0]['scientific_name'].should == 'Homo sapiens neanderthalensis'
      entries_second[1]['scientific_name'].should == 'Homo sapiens'
      entries_second[2]['scientific_name'].should == 'Homo'
      entries_second[3]['scientific_name'].should == 'Homininae'
    end
  end

  describe "GET ncbi_taxon_id2full_taxon_hierarchy from name" do
    it "returns a json representation of a taxons full hierarchy" do
      get :ncbi_taxon_id2full_taxon_hierarchy, { name: 'Escherichia coli O157:H7', format: 'json' }, valid_session
      response.should be_success
    end
  end

  describe "GET gis_to_taxa from list of protein gis" do
    it "returns a json representation of all taxa" do
      get :gis2taxa, { gis: [ 37544404, 254791767 ], format: 'json' }, valid_session
      response.should be_success
      entries = JSON.parse(response.body)
      entries[0][0]['scientific_name'].should == 'Escherichia coli O157:H7 str. TW14359'
      entries[1][0]['scientific_name'].should == 'Homo sapiens'
    end
  end
end
