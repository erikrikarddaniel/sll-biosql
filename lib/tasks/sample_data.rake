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
    og = OrganismGroup.create(name: 'wgs', test: false)
    og.organism_group_rows.create(ncbi_taxon_id: 329726)
    og.organism_group_rows.create(ncbi_taxon_id: 442391)
    og.organism_group_rows.create(ncbi_taxon_id: 208964)
    og.organism_group_rows.create(ncbi_taxon_id: 1000565)
    og.organism_group_rows.create(ncbi_taxon_id: 1005041)
  end
end
