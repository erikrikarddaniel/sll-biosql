# == Schema Information
#
# Table name: sequenced_genomes
#
#  ncbi_taxon_id :integer         not null, primary key
#  wgs           :boolean
#

require 'spec_helper'

describe SequencedGenome do
  before(:all) do
    @root_taxon = TaxonWithName.find_by_ncbi_taxon_id(1)
  end

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

  describe "all_taxa_with_ancestors" do
    before { @hs = SequencedGenome.find_by_ncbi_taxon_id(9606) }

    subject { @hs }

#    it "should give the correct taxons" do
#      SequencedGenome.all_taxa_with_ancestors.should include(@root)
#    end
  end
end
