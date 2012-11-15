require 'non_rails_testdata'
include NonRailsTestdata

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:truncate'].invoke
    insert_non_rails_testdata
    organism_groups
  end

  task populate_test: :environment do
    Rake::Task['db:truncate'].invoke
    insert_non_rails_testdata
  end

  def organism_groups
    og_gold = OrganismGroup.create(name: 'GOLD WGS', test: false, source: 'GOLD')
    og_gold.organism_group_rows.create(source_id: 'Gi21198', ncbi_taxon_id: 1234596)
    og_gold.organism_group_rows.create(source_id: 'Gi21185', ncbi_taxon_id: 1219061)
    og_gold.organism_group_rows.create(source_id: 'Gi18915', ncbi_taxon_id: 1200302)
    og_gold.organism_group_rows.create(source_id: 'Gi10962', ncbi_taxon_id: 1125723)
    og_gold.organism_group_rows.create(source_id: 'Gi09682', ncbi_taxon_id: 1111137)

    og_geba_2009 = OrganismGroup.create(name: 'GEBA 2009', test: false, source: 'Wu et al. Nature 2009')
    og_geba_2009.organism_group_rows.create(ncbi_taxon_id: 1111137)
    og_geba_2009.organism_group_rows.create(ncbi_taxon_id: 504728)
  end
end
