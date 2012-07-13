require 'spec_helper'

describe "fetch_gis/edit" do
  before(:each) do
    @fetch_gi = assign(:fetch_gi, stub_model(FetchGi,
      :gi => 1
    ))
  end

  it "renders the edit fetch_gi form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fetch_gis_path(@fetch_gi), :method => "post" do
      assert_select "input#fetch_gi_gi", :name => "fetch_gi[gi]"
    end
  end
end
