require 'spec_helper'

describe "taxon_attributes/index" do
  before(:each) do
    assign(:taxon_attributes, [
      stub_model(TaxonAttribute,
        :ncbi_taxon_id => 1,
        :type => "Type",
        :value => "Value"
      ),
      stub_model(TaxonAttribute,
        :ncbi_taxon_id => 1,
        :type => "Type",
        :value => "Value"
      )
    ])
  end

  it "renders a list of taxon_attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
