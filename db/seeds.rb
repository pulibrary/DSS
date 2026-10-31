require 'csv'

country_cache = Hash.new {|hash, name| hash[name] = Country.find_or_create_by!(name:) }
subject_cache = Hash.new {|hash, name| hash[name] = Subject.find_or_create_by!(name:) }

CSV.foreach(Rails.root.join('db', 'countries_regions.csv'), headers: true) do |row|
  country = country_cache[row['Country']]
  region_name = row['Region']
  next unless region_name

  region = Region.find_or_create_by(name: region_name)
  country.update(regions: [region].compact) if country.region_ids != [region.id]
end

[
  {countries: ['Indonesia'], title: 'Indonesia - Census of Agriculture 2003'},
  {countries: ['Libya'], title: 'The effect of settler farming on indigenous agriculture: Evidence from Italian Libya'},
  {countries: ['Spain'], title: 'Land reform and peasant revolution: Evidence from 1930s Spain'},
  {countries: ['Uganda'], title: 'Orange Fleshed Sweet Potatoes 2014, Baseline Survey [Uganda]'},
  {countries: ['China', 'India', 'Indonesia'], title: 'Air quality valuation using online surveys in three Asian megacities'},
].each do |raw|
  resource = Resource.find_or_create_by name: raw[:title], resource_type: 'Single study'
  resource.update countries: raw[:countries].map { country_cache[it] }
end

CSV.foreach(Rails.root.join('db', 'seed_resources.csv'), headers: true) do |row|
  countries = row['countries']&.split(',')&.map { country_cache[it] } || []
  subjects  = row['subjects']&.split(',')&.map { subject_cache[it] }  || []

  Resource.find_or_create_by!(name: row['title'], blurb: row['blurb']) do |resource|
    resource.countries = countries
    resource.subjects  = subjects
  end
end
