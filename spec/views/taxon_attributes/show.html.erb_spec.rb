require 'spec_helper'

describe "taxon_attributes/show" do
  before(:each) do
    @taxon_attribute = assign(:taxon_attribute, stub_model(TaxonAttribute,
      :ncbi_taxon_id => 1,
      :type => "Type",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
  end
end
