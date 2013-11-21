class DropBioentryRules < ActiveRecord::Migration
  #Drop rules for postgrs based on http://biopython.org/wiki/BioSQL#PostgreSQL
  def up
    execute '
    DROP RULE rule_bioentry_i1 ON bioentry;
    DROP RULE rule_bioentry_i2 ON bioentry;
    '
  end

  def down
  end
end
