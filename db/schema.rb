# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121025123751) do

  create_table "biodatabase", :primary_key => "biodatabase_id", :default => { :expr => "nextval('biodatabase_pk_seq'::regclass)" }, :force => true do |t|
    t.string "name",        :limit => 128, :null => false
    t.string "authority",   :limit => 128
    t.text   "description"
    t.index ["name"], :name => "biodatabase_name_key", :unique => true
    t.index ["authority"], :name => "db_auth"
  end

  create_table "taxon", :primary_key => "taxon_id", :default => { :expr => "nextval('taxon_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "ncbi_taxon_id"
    t.integer "parent_taxon_id"
    t.string  "node_rank",         :limit => 32
    t.integer "genetic_code",      :limit => 2
    t.integer "mito_genetic_code", :limit => 2
    t.integer "left_value"
    t.integer "right_value"
    t.index ["parent_taxon_id"], :name => "taxparent"
    t.index ["left_value"], :name => "xaktaxon_left_value", :unique => true
    t.index ["ncbi_taxon_id"], :name => "xaktaxon_ncbi_taxon_id", :unique => true
    t.index ["right_value"], :name => "xaktaxon_right_value", :unique => true
  end

  create_table "bioentry", :primary_key => "bioentry_id", :default => { :expr => "nextval('bioentry_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "biodatabase_id",                :null => false
    t.integer "taxon_id"
    t.string  "name",           :limit => 40,  :null => false
    t.string  "accession",      :limit => 128, :null => false
    t.string  "identifier",     :limit => 40
    t.string  "division",       :limit => 6
    t.text    "description"
    t.integer "version",                       :null => false
    t.index ["accession", "biodatabase_id", "version"], :name => "bioentry_accession_biodatabase_id_version_key", :unique => true
    t.index ["biodatabase_id"], :name => "bioentry_db"
    t.index ["identifier", "biodatabase_id"], :name => "bioentry_identifier_biodatabase_id_key", :unique => true
    t.index ["name"], :name => "bioentry_name"
    t.index ["taxon_id"], :name => "bioentry_tax"
    t.foreign_key ["taxon_id"], "taxon", ["taxon_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fktaxon_bioentry"
    t.foreign_key ["biodatabase_id"], "biodatabase", ["biodatabase_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkbiodatabase_bioentry"
  end

  create_table "dbxref", :primary_key => "dbxref_id", :default => { :expr => "nextval('dbxref_pk_seq'::regclass)" }, :force => true do |t|
    t.string  "dbname",    :limit => 40,  :null => false
    t.string  "accession", :limit => 128, :null => false
    t.integer "version",                  :null => false
    t.index ["accession", "dbname", "version"], :name => "dbxref_accession_dbname_version_key", :unique => true
    t.index ["dbname"], :name => "dbxref_db"
  end

  create_table "bioentry_dbxref", :id => false, :force => true do |t|
    t.integer "bioentry_id", :null => false
    t.integer "dbxref_id",   :null => false
    t.integer "rank"
    t.index ["dbxref_id"], :name => "dblink_dbx"
    t.foreign_key ["bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkbioentry_dblink"
    t.foreign_key ["dbxref_id"], "dbxref", ["dbxref_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkdbxref_dblink"
  end

  create_table "ontology", :primary_key => "ontology_id", :default => { :expr => "nextval('ontology_pk_seq'::regclass)" }, :force => true do |t|
    t.string "name",       :limit => 32, :null => false
    t.text   "definition"
    t.index ["name"], :name => "ontology_name_key", :unique => true
  end

  create_table "term", :primary_key => "term_id", :default => { :expr => "nextval('term_pk_seq'::regclass)" }, :force => true do |t|
    t.string  "name",                      :null => false
    t.text    "definition"
    t.string  "identifier",  :limit => 40
    t.string  "is_obsolete", :limit => 1
    t.integer "ontology_id",               :null => false
    t.index ["identifier"], :name => "term_identifier_key", :unique => true
    t.index ["name", "ontology_id", "is_obsolete"], :name => "term_name_ontology_id_is_obsolete_key", :unique => true
    t.index ["ontology_id"], :name => "term_ont"
    t.foreign_key ["ontology_id"], "ontology", ["ontology_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkont_term"
  end

  create_table "bioentry_path", :id => false, :force => true do |t|
    t.integer "object_bioentry_id",  :null => false
    t.integer "subject_bioentry_id", :null => false
    t.integer "term_id",             :null => false
    t.integer "distance"
    t.index ["object_bioentry_id", "subject_bioentry_id", "term_id", "distance"], :name => "bioentry_path_object_bioentry_id_subject_bioentry_id_term_i_key", :unique => true
    t.index ["subject_bioentry_id"], :name => "bioentrypath_child"
    t.index ["term_id"], :name => "bioentrypath_trm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_bioentrypath"
    t.foreign_key ["object_bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkparentent_bioentrypath"
    t.foreign_key ["subject_bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkchildent_bioentrypath"
  end

  create_table "bioentry_qualifier_value", :id => false, :force => true do |t|
    t.integer "bioentry_id",                :null => false
    t.integer "term_id",                    :null => false
    t.text    "value"
    t.integer "rank",        :default => 0, :null => false
    t.index ["bioentry_id", "term_id", "rank"], :name => "bioentry_qualifier_value_bioentry_id_term_id_rank_key", :unique => true
    t.index ["term_id"], :name => "bioentryqual_trm"
    t.foreign_key ["bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkbioentry_entqual"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_entqual"
  end

  create_table "reference", :primary_key => "reference_id", :default => { :expr => "nextval('reference_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "dbxref_id"
    t.text    "location",                :null => false
    t.text    "title"
    t.text    "authors"
    t.string  "crc",       :limit => 32
    t.index ["crc"], :name => "reference_crc_key", :unique => true
    t.index ["dbxref_id"], :name => "reference_dbxref_id_key", :unique => true
    t.foreign_key ["dbxref_id"], "dbxref", ["dbxref_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkdbxref_reference"
  end

  create_table "bioentry_reference", :id => false, :force => true do |t|
    t.integer "bioentry_id",                 :null => false
    t.integer "reference_id",                :null => false
    t.integer "start_pos"
    t.integer "end_pos"
    t.integer "rank",         :default => 0, :null => false
    t.index ["reference_id"], :name => "bioentryref_ref"
    t.foreign_key ["bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkbioentry_entryref"
    t.foreign_key ["reference_id"], "reference", ["reference_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkreference_entryref"
  end

  create_table "bioentry_relationship", :primary_key => "bioentry_relationship_id", :default => { :expr => "nextval('bioentry_relationship_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "object_bioentry_id",  :null => false
    t.integer "subject_bioentry_id", :null => false
    t.integer "term_id",             :null => false
    t.integer "rank"
    t.index ["object_bioentry_id", "subject_bioentry_id", "term_id"], :name => "bioentry_relationship_object_bioentry_id_subject_bioentry_i_key", :unique => true
    t.index ["subject_bioentry_id"], :name => "bioentryrel_child"
    t.index ["term_id"], :name => "bioentryrel_trm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_bioentryrel"
    t.foreign_key ["object_bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkparentent_bioentryrel"
    t.foreign_key ["subject_bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkchildent_bioentryrel"
  end

  create_table "biosequence", :id => false, :force => true do |t|
    t.integer "bioentry_id",               :null => false
    t.integer "version"
    t.integer "length"
    t.string  "alphabet",    :limit => 10
    t.text    "seq"
    t.foreign_key ["bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkbioentry_bioseq"
  end

  create_table "comment", :primary_key => "comment_id", :default => { :expr => "nextval('comment_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "bioentry_id",                 :null => false
    t.text    "comment_text",                :null => false
    t.integer "rank",         :default => 0, :null => false
    t.index ["bioentry_id", "rank"], :name => "comment_bioentry_id_rank_key", :unique => true
    t.foreign_key ["bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkbioentry_comment"
  end

  create_table "dbxref_qualifier_value", :id => false, :force => true do |t|
    t.integer "dbxref_id",                :null => false
    t.integer "term_id",                  :null => false
    t.integer "rank",      :default => 0, :null => false
    t.text    "value"
    t.index ["dbxref_id"], :name => "dbxrefqual_dbx"
    t.index ["term_id"], :name => "dbxrefqual_trm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fktrm_dbxrefqual"
    t.foreign_key ["dbxref_id"], "dbxref", ["dbxref_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkdbxref_dbxrefqual"
  end

  create_table "fetch_gis", :force => true do |t|
    t.integer  "gi"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "seqfeature", :primary_key => "seqfeature_id", :default => { :expr => "nextval('seqfeature_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "bioentry_id",                                 :null => false
    t.integer "type_term_id",                                :null => false
    t.integer "source_term_id",                              :null => false
    t.string  "display_name",   :limit => 64
    t.integer "rank",                         :default => 0, :null => false
    t.index ["bioentry_id", "type_term_id", "source_term_id", "rank"], :name => "seqfeature_bioentry_id_type_term_id_source_term_id_rank_key", :unique => true
    t.index ["source_term_id"], :name => "seqfeature_fsrc"
    t.index ["type_term_id"], :name => "seqfeature_trm"
    t.foreign_key ["type_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_seqfeature"
    t.foreign_key ["source_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fksourceterm_seqfeature"
    t.foreign_key ["bioentry_id"], "bioentry", ["bioentry_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkbioentry_seqfeature"
  end

  create_table "location", :primary_key => "location_id", :default => { :expr => "nextval('location_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "seqfeature_id",                :null => false
    t.integer "dbxref_id"
    t.integer "term_id"
    t.integer "start_pos"
    t.integer "end_pos"
    t.integer "strand",        :default => 0, :null => false
    t.integer "rank",          :default => 0, :null => false
    t.index ["seqfeature_id", "rank"], :name => "location_seqfeature_id_rank_key", :unique => true
    t.index ["dbxref_id"], :name => "seqfeatureloc_dbx"
    t.index ["start_pos", "end_pos"], :name => "seqfeatureloc_start"
    t.index ["term_id"], :name => "seqfeatureloc_trm"
    t.foreign_key ["seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkseqfeature_location"
    t.foreign_key ["dbxref_id"], "dbxref", ["dbxref_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkdbxref_location"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_featloc"
  end

  create_table "location_qualifier_value", :id => false, :force => true do |t|
    t.integer "location_id", :null => false
    t.integer "term_id",     :null => false
    t.string  "value",       :null => false
    t.integer "int_value"
    t.index ["term_id"], :name => "locationqual_trm"
    t.foreign_key ["location_id"], "location", ["location_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkfeatloc_locqual"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_locqual"
  end

  create_table "organism_groups", :force => true do |t|
    t.string   "name"
    t.boolean  "test"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "source"
  end

  create_table "organism_group_rows", :force => true do |t|
    t.integer  "organism_group_id"
    t.integer  "ncbi_taxon_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "source_id"
    t.index ["organism_group_id"], :name => "index_organism_group_rows_on_organism_group_id"
    t.foreign_key ["organism_group_id"], "organism_groups", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "organism_group_rows_organism_group_id_fkey"
  end

  create_table "protein_gi_taxons", :primary_key => "protein_gi", :default => { :expr => "nextval('protein_gi_taxons_protein_gi_seq'::regclass)" }, :force => true do |t|
    t.integer "taxon_id"
  end

  create_table "seqfeature_dbxref", :id => false, :force => true do |t|
    t.integer "seqfeature_id", :null => false
    t.integer "dbxref_id",     :null => false
    t.integer "rank"
    t.index ["dbxref_id"], :name => "feadblink_dbx"
    t.foreign_key ["seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkseqfeature_feadblink"
    t.foreign_key ["dbxref_id"], "dbxref", ["dbxref_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkdbxref_feadblink"
  end

  create_table "seqfeature_path", :id => false, :force => true do |t|
    t.integer "object_seqfeature_id",  :null => false
    t.integer "subject_seqfeature_id", :null => false
    t.integer "term_id",               :null => false
    t.integer "distance"
    t.index ["object_seqfeature_id", "subject_seqfeature_id", "term_id", "distance"], :name => "seqfeature_path_object_seqfeature_id_subject_seqfeature_id__key", :unique => true
    t.index ["subject_seqfeature_id"], :name => "seqfeaturepath_child"
    t.index ["term_id"], :name => "seqfeaturepath_trm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_seqfeatpath"
    t.foreign_key ["object_seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkparentfeat_seqfeatpath"
    t.foreign_key ["subject_seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkchildfeat_seqfeatpath"
  end

  create_table "seqfeature_qualifier_value", :id => false, :force => true do |t|
    t.integer "seqfeature_id",                :null => false
    t.integer "term_id",                      :null => false
    t.integer "rank",          :default => 0, :null => false
    t.text    "value",                        :null => false
    t.index ["term_id"], :name => "seqfeaturequal_trm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_featqual"
    t.foreign_key ["seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkseqfeature_featqual"
  end

  create_table "seqfeature_relationship", :primary_key => "seqfeature_relationship_id", :default => { :expr => "nextval('seqfeature_relationship_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "object_seqfeature_id",  :null => false
    t.integer "subject_seqfeature_id", :null => false
    t.integer "term_id",               :null => false
    t.integer "rank"
    t.index ["object_seqfeature_id", "subject_seqfeature_id", "term_id"], :name => "seqfeature_relationship_object_seqfeature_id_subject_seqfea_key", :unique => true
    t.index ["subject_seqfeature_id"], :name => "seqfeaturerel_child"
    t.index ["term_id"], :name => "seqfeaturerel_trm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :no_action, :name => "fkterm_seqfeatrel"
    t.foreign_key ["object_seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkparentfeat_seqfeatrel"
    t.foreign_key ["subject_seqfeature_id"], "seqfeature", ["seqfeature_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkchildfeat_seqfeatrel"
  end

  create_table "sequenced_genomes", :primary_key => "ncbi_taxon_id", :default => { :expr => "nextval('sequenced_genomes_ncbi_taxon_id_seq'::regclass)" }, :force => true do |t|
    t.boolean "wgs"
  end

  create_table "taxon_attributes", :force => true do |t|
    t.integer  "ncbi_taxon_id"
    t.string   "type"
    t.string   "value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "taxon_name", :id => false, :force => true do |t|
    t.integer "taxon_id",                 :null => false
    t.string  "name",                     :null => false
    t.string  "name_class", :limit => 32, :null => false
    t.index ["name"], :name => "taxnamename"
    t.index ["taxon_id"], :name => "taxnametaxonid"
    t.index ["name", "name_class", "taxon_id"], :name => "taxon_name_name_name_class_taxon_id_key", :unique => true
    t.foreign_key ["taxon_id"], "taxon", ["taxon_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktaxon_taxonname"
  end

  create_view "taxon_with_name", "SELECT t.taxon_id, t.parent_taxon_id, t.ncbi_taxon_id, t.node_rank, t.genetic_code, t.mito_genetic_code, t.left_value, t.right_value, tn.name AS scientific_name, sg.wgs FROM ((taxon t JOIN taxon_name tn ON ((t.taxon_id = tn.taxon_id))) LEFT JOIN sequenced_genomes sg ON ((t.ncbi_taxon_id = sg.ncbi_taxon_id))) WHERE ((tn.name_class)::text = 'scientific name'::text)", :force => true
  create_table "term_dbxref", :id => false, :force => true do |t|
    t.integer "term_id",   :null => false
    t.integer "dbxref_id", :null => false
    t.integer "rank"
    t.index ["dbxref_id"], :name => "trmdbxref_dbxrefid"
    t.foreign_key ["dbxref_id"], "dbxref", ["dbxref_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkdbxref_trmdbxref"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkterm_trmdbxref"
  end

  create_table "term_path", :primary_key => "term_path_id", :default => { :expr => "nextval('term_path_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "subject_term_id",   :null => false
    t.integer "predicate_term_id", :null => false
    t.integer "object_term_id",    :null => false
    t.integer "ontology_id",       :null => false
    t.integer "distance"
    t.index ["subject_term_id", "predicate_term_id", "object_term_id", "ontology_id", "distance"], :name => "term_path_subject_term_id_predicate_term_id_object_term_id__key", :unique => true
    t.index ["object_term_id"], :name => "trmpath_objectid"
    t.index ["ontology_id"], :name => "trmpath_ontid"
    t.index ["predicate_term_id"], :name => "trmpath_predicateid"
    t.foreign_key ["subject_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmsubject_trmpath"
    t.foreign_key ["predicate_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmpredicate_trmpath"
    t.foreign_key ["object_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmobject_trmpath"
    t.foreign_key ["ontology_id"], "ontology", ["ontology_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkontology_trmpath"
  end

  create_table "term_relationship", :primary_key => "term_relationship_id", :default => { :expr => "nextval('term_relationship_pk_seq'::regclass)" }, :force => true do |t|
    t.integer "subject_term_id",   :null => false
    t.integer "predicate_term_id", :null => false
    t.integer "object_term_id",    :null => false
    t.integer "ontology_id",       :null => false
    t.index ["subject_term_id", "predicate_term_id", "object_term_id", "ontology_id"], :name => "term_relationship_subject_term_id_predicate_term_id_object__key", :unique => true
    t.index ["object_term_id"], :name => "trmrel_objectid"
    t.index ["ontology_id"], :name => "trmrel_ontid"
    t.index ["predicate_term_id"], :name => "trmrel_predicateid"
    t.foreign_key ["subject_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmsubject_trmrel"
    t.foreign_key ["predicate_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmpredicate_trmrel"
    t.foreign_key ["object_term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmobject_trmrel"
    t.foreign_key ["ontology_id"], "ontology", ["ontology_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkontology_trmrel"
  end

  create_table "term_relationship_term", :id => false, :force => true do |t|
    t.integer "term_relationship_id", :null => false
    t.integer "term_id",              :null => false
    t.index ["term_id"], :name => "term_relationship_term_term_id_key", :unique => true
    t.foreign_key ["term_relationship_id"], "term_relationship", ["term_relationship_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrmrel_trmreltrm"
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fktrm_trmreltrm"
  end

  create_table "term_synonym", :id => false, :force => true do |t|
    t.string  "synonym", :null => false
    t.integer "term_id", :null => false
    t.foreign_key ["term_id"], "term", ["term_id"], :on_update => :no_action, :on_delete => :cascade, :name => "fkterm_syn"
  end

end
