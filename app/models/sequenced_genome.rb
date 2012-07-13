# == Schema Information
#
# Table name: sequenced_genomes
#
#  ncbi_taxon_id :integer         not null, primary key
#  wgs           :boolean
#

class SequencedGenome < ActiveRecord::Base
  attr_accessible :ncbi_taxon_id, :sequenced
end
