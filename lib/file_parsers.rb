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

  def self.import_functional_hierarchy_json(io)
    Function.transaction do
      _parse_function_from_json(JSON.parse(io.read))
    end
  end

  def self.import_functional_hierarchy_meganfunchierarchy(io)
    Function.transaction do
      io.each do |mline|
	mline.chomp!
	mline.sub!(/\s*#.*/, '')
	next if mline == ''
	funcs = mline.split("\t")[0].split(";")
	p = nil
	funcs.each_with_index do |func, i|
	  if f = Function.find_by_name_and_source_db(func, funcs[0])
	    p = f
	  else
	    p = Function.create!(name: func, source_db: funcs[0], parent_id: ( p ? p.id : nil ))
	  end
	end
      end
    end
  end

private

  def _parse_function_from_json(json, parent = nil)
    data = {
      name: json['name'],
      source_db: json['source_db'],
      source_identifier: json['source_identifier']
    }
    current = Function.find_by_name_and_source_db(data[:name], data[:source_db])
    unless current
      if parent
	current = parent.children.create(data)
      else
	current = Function.create(data)
      end
    end
    if json['children']
      json['children'].each do |child|
	_parse_function_from_json(child, current)
      end
    end
  end
end
