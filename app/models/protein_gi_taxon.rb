# == Schema Information
#
# Table name: protein_gi_taxons
#
#  protein_gi :integer         not null, primary key
#  taxon_id   :integer
#

class ProteinGiTaxon < ActiveRecord::Base
  attr_accessible :protein_gi, :taxon_id
  set_primary_key :protein_gi
end