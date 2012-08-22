require 'non_rails_testdata'
include NonRailsTestdata

namespace :db do
  TESTDATADIR = "non_rails_stuff/testdata/"
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    insert_non_rails_testdata
  end
end
