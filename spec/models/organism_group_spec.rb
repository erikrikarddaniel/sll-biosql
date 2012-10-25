# == Schema Information
#
# Table name: organism_groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  test       :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe OrganismGroup do
  let(:organism_group) { FactoryGirl.create(:organism_group) }

  before(:each) do 
    @organism_group = organism_group
  end

  subject { @organism_group }

  it { should respond_to(:name) }

  it { should be_valid }
  
  describe "Should not be valid when name is not present" do
    before { @organism_group.name = "" }
    it { should_not be_valid }
  end
end
