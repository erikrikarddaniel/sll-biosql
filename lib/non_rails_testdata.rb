module NonRailsTestdata
  def insert_non_rails_testdata
    db = ActiveRecord::Base.connection
    datadir = "#{Rails.root}/#{TESTDATADIR}"
    puts "*** Inserting testdata from #{datadir} ***"
    Dir.open(datadir).each do |file|
      next unless file =~ /\.sql/
      next if file =~ /^\./
      puts "Handling #{file}"
      if file =~ /\.gz$/
	db.execute(`gunzip -c #{datadir}/#{file}`)
      elsif file =~ /\.bz2$/
	db.execute(`bunzip2 -c #{datadir}/#{file}`)
      else
	db.execute(`cat #{datadir}/#{file}`)
      end
    end
  end
end
