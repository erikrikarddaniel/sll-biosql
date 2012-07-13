require 'spec_helper'

describe "fetch_gis/new" do
  before(:each) do
    assign(:fetch_gi, stub_model(FetchGi,
      :gi => 1
    ).as_new_record)
  end

  it "renders new fetch_gi form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fetch_gis_path, :method => "post" do
      assert_select "input#fetch_gi_gi", :name => "fetch_gi[gi]"
    end
  end
end
