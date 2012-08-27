require 'non_rails_testdata'
include NonRailsTestdata

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:truncate'].invoke
    insert_non_rails_testdata
  end
end
