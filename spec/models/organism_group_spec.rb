# == Schema Information
#
# Table name: organism_groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  test       :boolean
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  source     :text
#

require 'file_parsers'
require 'spec_helper'

include FileParsers

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

  describe "should not be possible to add another with the same name" do
    before do
      @organism_group.save!
      @og2 = OrganismGroup.new(name: @organism_group.name)
    end

    subject { @og2 }

    it { should_not be_valid }
  end

  describe "import cases" do
    it "should import a list of ncbi_taxon_ids" do
      parse_ncbi_taxon_id_for_organism_group(@organism_group, fixture_file_upload("/ncbi_taxon_ids.csv"))
      @organism_group.organism_group_rows.length.should == 10
      @organism_group.organism_group_rows.map { |r| r.ncbi_taxon_id }.should include(105560)
    end
  end
end
