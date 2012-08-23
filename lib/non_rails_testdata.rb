module NonRailsTestdata
  TESTDATADIR = "non_rails_stuff/testdata/"

  def insert_non_rails_testdata
    db = ActiveRecord::Base.connection
    datadir = "#{Rails.root}/#{TESTDATADIR}"
    Dir.open(datadir).each do |file|
      next unless file =~ /\.sql/
      next if file =~ /^\./
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
