module FileParsers
  def parse_ncbi_taxon_id_for_organism_group(organism_group, io)
    io.each do |line|
      line.chomp!
      line.sub(/\s*#.*/, '')
      next if line == ''
      fields = line.split(/\t/)
      organism_group.organism_group_rows.create(ncbi_taxon_id: fields[0])
    end
  end
end
