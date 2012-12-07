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

  def self.import_functional_hierarchy(io)
    _parse_function_from_json(JSON.parse(io.read))
  end

private

  def _parse_function_from_json(json, parent = nil)
    data = {
      name: json['name'],
      source_db: json['source_db'],
      source_identifier: json['source_identifier']
    }
    if parent
      parent = parent.children.create(data)
    else
      parent = Function.create(data)
    end
    if json['children']
      json['children'].each do |child|
	_parse_function_from_json(child, parent)
      end
    end
  end
end
