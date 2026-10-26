require 'csv'

CSV.foreach(Rails.root.join('db', 'countries_regions.csv'), headers: true) do |row|
  country = Country.find_or_create_by(name: row['Country'])
  region_name = row['Region']
  region = Region.find_by(name: region_name)
  country.regions = [region].compact
end

[
  {country: 'Indonesia', title: 'Indonesia - Census of Agriculture 2003'},
  {country: 'Libya', title: 'The effect of settler farming on indigenous agriculture: Evidence from Italian Libya'},
  {country: 'Spain', title: 'Land reform and peasant revolution: Evidence from 1930s Spain'},
  {country: 'Uganda', title: 'Orange Fleshed Sweet Potatoes 2014, Baseline Survey [Uganda]'}
].each do |resource|
  Resource.create(name: resource[:title],
                  countries: [Country.find_by(name: resource[:country])],
                  resource_type: 'Single study')
end
CSV.foreach(Rails.root.join('db', 'seed_resources.csv'), headers: true) do |row|
  Resource.create(name: row['title'], blurb: row['blurb'])
end
