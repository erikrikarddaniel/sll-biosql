# == Schema Information
#
# Table name: sequenced_genomes
#
#  ncbi_taxon_id :integer         not null, primary key
#  wgs           :boolean
#

class SequencedGenome < ActiveRecord::Base
  attr_accessible :ncbi_taxon_id, :sequenced
  has_one :taxon_with_name

  def self.all_taxa3
    taxa = []
    self.all.each do |gold_genome|
      taxa + gold_genome.taxon_with_name.all_up_to_root
    end
  end


  def self.all_taxa(leaves)
    taxon_array = TaxonWithName.find_by_sql(%Q{
    with recursive ancestors(taxon_id) as (
        select t.taxon_id, t.parent_taxon_id, t.ncbi_taxon_id, t.wgs, t.scientific_name
        from taxon_with_name t
        where t.ncbi_taxon_id in (#{leaves.join(',')})
        union all
        select t.taxon_id, t.parent_taxon_id, t.ncbi_taxon_id, t.wgs, t.scientific_name
        from taxon_with_name t
        join ancestors on t.taxon_id = ancestors.parent_taxon_id
    )
    select taxon_id, parent_taxon_id, ncbi_taxon_id, wgs, scientific_name
    from tree
})
  end

  def self.all_taxa2(leaves)
    taxon_array = self.find_by_sql(%Q{
    WITH RECURSIVE Ancestors AS
(
   SELECT taxon_id, parent_taxon_id, ncbi_taxon_id FROM taxon_with_name WHERE parent_taxon_id IS NULL  
UNION ALL
   SELECT child.taxon_id, child.parent_taxon_id, ncbi_taxon_id FROM taxon_with_name child INNER JOIN
      Ancestors p ON p.taxon_id=child.parent_taxon_id

)
SELECT * FROM Ancestors a WHERE a.ncbi_taxon_id= #{leaves}
  end
end
