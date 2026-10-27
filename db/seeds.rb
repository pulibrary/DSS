require 'csv'
[
  {countries: ['Indonesia'], title: 'Indonesia - Census of Agriculture 2003'},
  {countries: ['Libya'], title: 'The effect of settler farming on indigenous agriculture: Evidence from Italian Libya'},
  {countries: ['Spain'], title: 'Land reform and peasant revolution: Evidence from 1930s Spain'},
  {countries: ['Uganda'], title: 'Orange Fleshed Sweet Potatoes 2014, Baseline Survey [Uganda]'},
  {countries: ['China', 'India', 'Indonesia'], title: 'Air quality valuation using online surveys in three Asian megacities'},
].each do |raw|
  resource = Resource.find_or_create_by name: raw[:title], resource_type: 'Single study'
  resource.update countries: raw[:countries].map { Country.find_or_create_by(name: it) }
end
CSV.foreach(Rails.root.join('db', 'seed_resources.csv'), headers: true) do |row|
  Resource.find_or_create_by(name: row['title'], blurb: row['blurb'])
end
