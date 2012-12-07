require 'spec_helper'

describe "functions/show" do
  before(:each) do
    @function = assign(:function, stub_model(Function,
      :name => "Name",
      :source_db => "Source Db",
      :source_identifier => "Source Identifier",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source Db/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source Identifier/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
