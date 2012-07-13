require 'spec_helper'

describe "protein_gi_taxons/show" do
  before(:each) do
    @protein_gi_taxon = assign(:protein_gi_taxon, stub_model(ProteinGiTaxon,
      :protein_gi => 1,
      :taxon_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
