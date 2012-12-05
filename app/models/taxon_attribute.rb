# == Schema Information
#
# Table name: taxon_attributes
#
#  id            :integer         not null, primary key
#  ncbi_taxon_id :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  attrs         :string(255)
#

class TaxonAttribute < ActiveRecord::Base
  attr_accessible :ncbi_taxon_id, :attrs
  store :attrs, accessors: [ :ncbi_genome_aa_file_path, :ncbi_genome_nuc_file_path ]
end
