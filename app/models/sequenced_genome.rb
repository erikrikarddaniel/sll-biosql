# == Schema Information
#
# Table name: sequenced_genomes
#
#  ncbi_taxon_id :integer         not null, primary key
#  wgs           :boolean
#

class SequencedGenome < ActiveRecord::Base
  attr_accessible :ncbi_taxon_id, :sequenced
  has_one :taxon_with_name, :foreign_key => :ncbi_taxon_id

  def self.all_taxa_with_ancestors
    taxa = []
    self.all.each do |gold_genome|
      if gold_genome.taxon_with_name
        taxa << gold_genome.taxon_with_name.all_up_to_root
      end
    end
    return taxa
  end
end
