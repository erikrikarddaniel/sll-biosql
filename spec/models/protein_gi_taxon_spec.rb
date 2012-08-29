# == Schema Information
#
# Table name: protein_gi_taxons
#
#  protein_gi :integer         not null, primary key
#  taxon_id   :integer
#

require 'spec_helper'

describe ProteinGiTaxon do
  before do
    @e_coli_proteins = ProteinGiTaxon.find_all_by_taxon_id(544404)
  end

  subject { @e_coli_proteins }

  its(:length) { should == 10761 }
end
