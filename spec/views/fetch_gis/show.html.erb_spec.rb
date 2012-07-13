require 'spec_helper'

describe "fetch_gis/show" do
  before(:each) do
    @fetch_gi = assign(:fetch_gi, stub_model(FetchGi,
      :gi => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
