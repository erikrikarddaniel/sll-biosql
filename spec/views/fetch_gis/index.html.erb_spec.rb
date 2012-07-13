require 'spec_helper'

describe "fetch_gis/index" do
  before(:each) do
    assign(:fetch_gis, [
      stub_model(FetchGi,
        :gi => 1
      ),
      stub_model(FetchGi,
        :gi => 1
      )
    ])
  end

  it "renders a list of fetch_gis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
