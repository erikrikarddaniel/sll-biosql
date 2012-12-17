DATA_DIR = "data"
MEGAN_DIR = "#{DATA_DIR}/megan"
MEGAN_HIERARCHY_SUFFIX = "meganhierarchy"

require 'file_parsers'

namespace :db do
  desc "Import various files in the data/ directory"

  task import_megan_hierarchies: :environment do
    puts "Searching #{MEGAN_DIR} for *.#{MEGAN_HIERARCHY_SUFFIX} files"
    Dir.open(MEGAN_DIR).find_all { |f| f =~ /^.*\.#{MEGAN_HIERARCHY_SUFFIX}$/ }.each do |meganfile|
      puts "Importing #{meganfile}"
      FileParsers.import_functional_hierarchy_meganfunchierarchy(File.open("#{MEGAN_DIR}/#{meganfile}"))
      puts "Done"
    end
  end
end
