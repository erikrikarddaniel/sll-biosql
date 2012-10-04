require 'spec_helper'

describe "taxon_attributes/edit" do
  before(:each) do
    @taxon_attribute = assign(:taxon_attribute, stub_model(TaxonAttribute,
      :ncbi_taxon_id => 1,
      :type => "",
      :value => "MyString"
    ))
  end

  it "renders the edit taxon_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taxon_attributes_path(@taxon_attribute), :method => "post" do
      assert_select "input#taxon_attribute_ncbi_taxon_id", :name => "taxon_attribute[ncbi_taxon_id]"
      assert_select "input#taxon_attribute_type", :name => "taxon_attribute[type]"
      assert_select "input#taxon_attribute_value", :name => "taxon_attribute[value]"
    end
  end
end
