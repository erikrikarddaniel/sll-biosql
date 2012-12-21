require 'non_rails_testdata'
include NonRailsTestdata

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:truncate'].invoke
    insert_non_rails_testdata
    organism_groups
    functions
  end

  desc "Fill test data with non-Rails data"
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

  def functions
    seed_functions
    kegg_functions
  end

  def seed_functions
    root = Function.create(name: "SEED root", source_db: "SEED")
    nitrogen = root.children.create(name: "Nitrogen metabolism", source_db: "SEED")
    no_synthase = nitrogen.children.create(name: "Nitric_oxide_synthase", source_db: "SEED")
    no_synthase.children.create(name: "Manganese superoxide dismutase (EC 1.15.1.1)", source_db: "SEED")
    no_synthase.children.create(name: "putative cytochrome P450 hydroxylase", source_db: "SEED")
    nitrosative_stress = nitrogen.children.create(name: "Nitrosative_stress", source_db: "SEED")
    nitrosative_stress.children.create(name: "Nitric oxide reductase FlRd-NAD(+) reductase (EC 1.18.1.-)", source_db: "SEED")
  end

  def kegg_functions
    root = Function.create(name: "KEGG root", source_db: "KEGG")
    met = root.children.create(name: "Metabolism", source_db: "KEGG")
    energy_met = met.children.create(name: "Energy Metabolism", source_db: "KEGG")
    nitrogen_met = energy_met.children.create(name: "Nitrogen Metabolism", source_db: "KEGG")
    nitrogen_met.children.create(name: "K00260", source_db: "KEGG")
    nitrogen_met.children.create(name: "K00261", source_db: "KEGG")
    nitrogen_met.children.create(name: "K00262", source_db: "KEGG")
    nitrogen_met.children.create(name: "K00265", source_db: "KEGG")
  end
end
