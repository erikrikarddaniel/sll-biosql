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

require 'spec_helper'

describe TaxonAttribute do
  before do
    @taxon_attribute = TaxonAttribute.create(
      ncbi_taxon_id: 		544404,
    )
    @taxon_attribute.ncbi_genome_aa_file_path = 'genomes/Bacteria/Escherichia_coli_O157_H7_TW14359_uid59235'
  end

  subject { @taxon_attribute }

  it { should respond_to(:ncbi_taxon_id) }
  it { should respond_to(:ncbi_genome_aa_file_path) }
  it { should respond_to(:ncbi_genome_nuc_file_path) }

  describe 'only one instance per ncbi_taxon_id' do
    before do
      @ta = TaxonAttribute.new(ncbi_taxon_id: @taxon_attribute.ncbi_taxon_id)
    end

    subject { @ta }

    it { should_not be_valid }
  end
end
