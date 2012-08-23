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
  before(:all) do
    insert_non_rails_testdata
  end

  describe "all_taxa" do
    it "should be possible to find Homo sapiens" do
      before { @hs = SequencedGenome.find_by_ncbi_taxon_id(9606) }

      subject { @hs }

      it { should respond_to(:sequenced) }
    end
#    it "should give the correct taxons" do
#      SequencedGenome.all_taxa.should include(root_taxon)
#    end
  end
end
