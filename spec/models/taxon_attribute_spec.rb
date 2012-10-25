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

require 'spec_helper'

describe TaxonAttribute do
  before do
    @taxon_attribute = TaxonAttribute.create(
      ncbi_taxon_id: 	544404,
      type:		'NCBI FTP genome protein file path',
      value:		'genomes/Bacteria/Escherichia_coli_O157_H7_TW14359_uid59235'
    )
  end

  subject { @taxon_attribute }

  it { should respond_to(:ncbi_taxon_id) }
  it { should respond_to(:type) }
  it { should respond_to(:value) }
end
