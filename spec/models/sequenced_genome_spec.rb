# == Schema Information
#
# Table name: sequenced_genomes
#
#  ncbi_taxon_id :integer         not null, primary key
#  wgs           :boolean
#

require 'spec_helper'

require 'non_rails_testdata'
include NonRailsTestdata

describe SequencedGenome do
  it "should be possible to find H. s. by ncbi_taxon_id" do
    SequencedGenome.find_by_ncbi_taxon_id(9606) 
  end

  describe 'basic operations' do
    before do
      @hs = SequencedGenome.find_by_ncbi_taxon_id(9606) 
    end
    subject { @hs }

    it { should respond_to(:wgs) }
    its(:wgs) { should == true }
  end

#  before do
#    @hs = SequencedGenome.find_by_ncbi_taxon_id(9606) 
#  end
#
#  subject { @hs }
#  before(:all) do
#    insert_non_rails_testdata
#  end

#  describe "all_taxa" do
#    before { @hs = SequencedGenome.find_by_ncbi_taxon_id(9606) }
#
#    it "should be possible to find Homo sapiens" do
#
#      subject { @hs }
#
#      it { should respond_to(:sequenced) }
#    end
#    it "should give the correct taxons" do
#      SequencedGenome.all_taxa.should include(root_taxon)
#    end
#  end
end
