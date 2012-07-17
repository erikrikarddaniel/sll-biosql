FactoryGirl.define do
  factory :taxon_with_name do
    factory :taxon do
      sequence(:ncbi_taxon_id){ |n| "10#{n}" }
      sequence(:taxon_id){ |n| "10#{n}" }
      parent_taxon
      wgs 'true'
    end
    factory :taxon_name do
      sequence(:
  end
  factory :hmm_profile2 do
    sequence(:name){ |n| "Example Class #{n}" }
    sequence(:protein_name) { |n| "NrdX #{n}" }
    sequence(:hierarchy) { |n| "00#{n+1}" }
    sequence(:version) { |n| "version #{n}" }
  end
  factory :hmm_profile do
    sequence(:name){ |n| "Example Class #{n}" }
    sequence(:protein_name) { |n| "NrdX #{n}" }
    sequence(:hierarchy) { |n| "00#{n+1}" }
    sequence(:version) { |n| "version #{n}" }
  end  
end
