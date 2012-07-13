require 'spec_helper'

describe "protein_gi_taxons/edit" do
  before(:each) do
    @protein_gi_taxon = assign(:protein_gi_taxon, stub_model(ProteinGiTaxon,
      :protein_gi => 1,
      :taxon_id => 1
    ))
  end

  it "renders the edit protein_gi_taxon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => protein_gi_taxons_path(@protein_gi_taxon), :method => "post" do
      assert_select "input#protein_gi_taxon_protein_gi", :name => "protein_gi_taxon[protein_gi]"
      assert_select "input#protein_gi_taxon_taxon_id", :name => "protein_gi_taxon[taxon_id]"
    end
  end
end
