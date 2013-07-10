# == Schema Information
#
# Table name: taxon_with_name
#
#  taxon_id          :integer         primary key
#  parent_taxon_id   :integer
#  ncbi_taxon_id     :integer
#  node_rank         :string(32)
#  genetic_code      :integer(2)
#  mito_genetic_code :integer(2)
#  left_value        :integer
#  right_value       :integer
#  scientific_name   :string(255)
#  wgs               :boolean
#

class TaxonWithName < ActiveRecord::Base
  self.table_name = 'taxon_with_name'
  self.primary_key = 'taxon_id'

  has_many :children, :class_name => 'TaxonWithName', :foreign_key => 'parent_taxon_id', :primary_key => 'taxon_id'
  belongs_to :parent, :class_name => 'TaxonWithName', :foreign_key => 'parent_taxon_id', :primary_key => 'taxon_id'

  has_many :protein_gi_taxons, :foreign_key => :taxon_id, :primary_key => :ncbi_taxon_id

  def TaxonWithName.root
    TaxonWithName.where('taxon_id = parent_taxon_id').first
  end

  def TaxonWithName.from_synonym(name)
    TaxonWithName.where("taxon_id = ( SELECT taxon_id FROM taxon_name WHERE name = '#{name}' )").first
  end
  
  def all_up_to_root
    all_up_to_root_rec(self, [])
  end

  private
  
  def all_up_to_root_rec(twn, ancestors)
    ancestors << twn
    if twn.parent and twn.parent != twn
      all_up_to_root_rec(twn.parent, ancestors)
    else
      return ancestors
    end
  end
end
