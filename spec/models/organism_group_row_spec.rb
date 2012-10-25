# == Schema Information
#
# Table name: organism_group_rows
#
#  id                :integer         not null, primary key
#  organism_group_id :integer
#  ncbi_taxon_id     :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  source_id         :text
#

require 'spec_helper'

describe OrganismGroupRow do
  let(:organism_group) { FactoryGirl.create(:organism_group) }

  before(:each) do
    @organism_group_rows = [
      organism_group.organism_group_rows.create(ncbi_taxon_id: 329726)
    ]
  end

  subject { @organism_group_rows[0] }

  it { should respond_to(:ncbi_taxon_id) }

  it { should respond_to(:organism_group) }

  #describe "it should be possible to navigate to the organism_group" do
    #@organism_group_rows[0].organism_group.name.should == 'wgs'
  #end
end
