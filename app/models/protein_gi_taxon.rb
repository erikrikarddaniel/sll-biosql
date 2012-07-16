# == Schema Information
#
# Table name: protein_gi_taxons
#
#  protein_gi :integer         not null, primary key
#  taxon_id   :integer
#

class ProteinGiTaxon < ActiveRecord::Base
  attr_accessible :protein_gi, :taxon_id
  self.primary_key = :protein_gi

  belongs_to :taxon_with_name, :foreign_key => :taxon_id
end
