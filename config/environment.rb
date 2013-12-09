# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SllBiosql::Application.initialize!

#My MIME types
Mime::Type.register "text/fasta", :fasta
Mime::Type.register "text/gb", :gb
