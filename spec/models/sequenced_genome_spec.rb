# == Schema Information
#
# Table name: sequenced_genomes
#
#  ncbi_taxon_id :integer         not null, primary key
#  wgs           :boolean
#

require 'spec_helper'

describe SequencedGenome do
  describe "all_taxa" do
    let!(:root_taxon) { FactoryGirl.create(:taxon_with_name) }
    let!(:taxon_branch) { FactoryGirl.create(:taxon_with_name, parent_taxon: root_taxon ) }
    let!(:taxon_child1) { FactoryGirl.create(:taxon_with_name, parent_taxon: root_taxon ) }
    let!(:taxon_child2) { FactoryGirl.create(:taxon_with_name, parent_taxon: taxon_child1) }

    let!(:sequenced_genome) { FactoryGirl.create(:sequenced_genome, taxon_with_name: root_taxon) }
    let!(:sequenced_genome1) { FactoryGirl.create(:sequenced_genome, taxon_with_name: taxon_child1) }
    let!(:sequenced_genome2) { FactoryGirl.create(:sequenced_genome, taxon_with_name: taxon_branch) }
    let!(:sequenced_genome3) { FactoryGirl.create(:sequenced_genome, taxon_with_name: taxon_child1) }
    let!(:sequenced_genome4) { FactoryGirl.create(:sequenced_genome, taxon_with_name: taxon_child2n) }
    
    it "should give the correct taxons" do
      SequencedGenome.all_taxa.should include(root_taxon)
    end
  end
end
