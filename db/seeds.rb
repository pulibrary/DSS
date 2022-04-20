[
  {country: 'Indonesia', title: 'Indonesia - Census of Agriculture 2003'},
  {country: 'Libya', title: 'The effect of settler farming on indigenous agriculture: Evidence from Italian Libya'},
  {country: 'Spain', title: 'Land reform and peasant revolution: Evidence from 1930s Spain'},
  {country: 'Uganda', title: 'Orange Fleshed Sweet Potatoes 2014, Baseline Survey [Uganda]'}
].each do |resource|
  Resource.create(name: resource[:title],
                  countries: [Country.create(name: resource[:country])],
                  resource_type: 'Single study')
end
