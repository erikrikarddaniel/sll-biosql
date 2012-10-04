require 'spec_helper'

describe "taxon_attributes/new" do
  before(:each) do
    assign(:taxon_attribute, stub_model(TaxonAttribute,
      :ncbi_taxon_id => 1,
      :type => "",
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new taxon_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => taxon_attributes_path, :method => "post" do
      assert_select "input#taxon_attribute_ncbi_taxon_id", :name => "taxon_attribute[ncbi_taxon_id]"
      assert_select "input#taxon_attribute_type", :name => "taxon_attribute[type]"
      assert_select "input#taxon_attribute_value", :name => "taxon_attribute[value]"
    end
  end
end
