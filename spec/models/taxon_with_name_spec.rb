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

require 'spec_helper'

describe TaxonWithName do
  it 'should return the root taxon' do
    root = TaxonWithName.root
    root.should_not == nil
    root.scientific_name.should == 'root'
  end

  before do 
    @root = TaxonWithName.root 
    @cellular = TaxonWithName.find_by_scientific_name('cellular organisms') 
    @bacteria = TaxonWithName.find_by_scientific_name('Bacteria')
    @enterophage = TaxonWithName.find_by_scientific_name('Enterobacteria phage PRD1')
    @homo = TaxonWithName.find_by_scientific_name('Homo')
    @hs = TaxonWithName.find_by_scientific_name('Homo sapiens')
    @neanderthal = TaxonWithName.find_by_scientific_name('Homo sapiens neanderthalensis')
  end

  subject { @root }

  it { should respond_to(:parent) }
  its(:parent) { should == @root }

  it { should respond_to(:children) }
  its(:children) { should include @cellular }

  describe 'parent-child relationsships' do
    subject { @hs }

    its(:parent) { should == @homo }
    its(:children) { should == [ @neanderthal ] }

    it "should have an all_up_root method" do
      @hs.all_up_to_root.map { |t| t.scientific_name }.should == ["Homo sapiens", "Homo", "Homininae", "Hominidae", "Hominoidea", "Catarrhini", "Simiiformes", "Haplorrhini", "Primates", "Euarchontoglires", "Eutheria", "Theria", "Mammalia", "Amniota", "Tetrapoda", "Sarcopterygii", "Euteleostomi", "Teleostomi", "Gnathostomata", "Vertebrata", "Craniata", "Chordata", "Deuterostomia", "Coelomata", "Bilateria", "Eumetazoa", "Metazoa", "Opisthokonta", "Eukaryota", "cellular organisms", "root"]
    end
  end

  describe 'whole genome sequenced' do
    before do
      @wgs_taxa = TaxonWithName.find_all_by_wgs(true)
    end

    subject { @wgs_taxa }

    its(:length) { should > 0 }
    it { should include @enterophage }
    it { should_not include @bacteria }
  end

  describe 'Synonyms' do
    it "should return an identical object from a synonym" do
      TaxonWithName.from_synonym('Homo neanderthalensis').should == @neanderthal
    end
  end
end
