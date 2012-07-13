require 'spec_helper'

describe "protein_gi_taxons/index" do
  before(:each) do
    assign(:protein_gi_taxons, [
      stub_model(ProteinGiTaxon,
        :protein_gi => 1,
        :taxon_id => 1
      ),
      stub_model(ProteinGiTaxon,
        :protein_gi => 1,
        :taxon_id => 1
      )
    ])
  end

  it "renders a list of protein_gi_taxons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
