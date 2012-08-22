namespace :db do
  TESTDATADIR = "non_rails_stuff/testdata/"
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    insert_example_taxa
  end

  def insert_example_taxa
    db = ActiveRecord::Base.connection
    puts "*** Inserting testdata from #{TESTDATADIR}, db: #{db} ***"
    Dir.open(TESTDATADIR).each do |file|
      next unless file =~ /\.sql/
      next if file =~ /^\./
      puts "Handling #{file}"
      if file =~ /\.gz$/
	db.execute(`gunzip -c #{TESTDATADIR}/#{file}`)
      elsif file =~ /\.bz2$/
	db.execute(`bunzip2 -c #{TESTDATADIR}/#{file}`)
      else
	db.execute(`cat #{TESTDATADIR}/#{file}`)
      end
    end
  end
end
