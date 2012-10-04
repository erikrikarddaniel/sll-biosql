# == Schema Information
#
# Table name: taxon_attributes
#
#  id            :integer         not null, primary key
#  ncbi_taxon_id :integer
#  type          :string(255)
#  value         :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class TaxonAttribute < ActiveRecord::Base
  attr_accessible :ncbi_taxon_id, :type, :value
end
