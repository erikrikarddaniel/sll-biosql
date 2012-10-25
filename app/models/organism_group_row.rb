# == Schema Information
#
# Table name: organism_group_rows
#
#  id                :integer         not null, primary key
#  organism_group_id :integer
#  ncbi_taxon_id     :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class OrganismGroupRow < ActiveRecord::Base
  attr_accessible :ncbi_taxon_id, :organism_group_id
  belongs_to :organism_group
end
