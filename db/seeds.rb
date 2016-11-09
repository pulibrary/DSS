# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach("#{Rails.root}/db/seeds/resources.csv", :headers => true) do |row|
  Resource.create!(row.to_hash)
end

CSV.foreach("#{Rails.root}/db/seeds/studies.csv", :headers => true) do |row|
  Study.create!(row.to_hash)
end

CSV.foreach("#{Rails.root}/db/seeds/files.csv", :headers => true) do |row|
  data_file = DataFile.create(row.to_hash)
  study = Study.where("legacy_id = ?", row['original_study_id']).first
  unless study.nil?
    puts study.id
    data_file.study_id = study.id
    data_file.save
  end
end

def get_terms
  terms = []
  CSV.foreach("#{Rails.root}/db/seeds/KeyTerms.csv", :headers => true) do |row|
    terms << row.to_hash
  end

  processed_terms = []
  terms.each do |term|
    term_split = term['key_term'].split(/-/)
    if term_split.size == 1
      processed_terms << term
    else
      row_first = term
      row_second = term.dup
      row_first['key_term'] = term_split[0].rstrip!
      row_first['type'] = 'S'
      row_second['key_term'] = term_split[1].lstrip!
      row_second['type'] = 'R'
      processed_terms << row_first
      processed_terms << row_second
    end
  end
  processed_terms
end

def get_term_resource_links
  link_terms = []
  CSV.foreach("#{Rails.root}/db/seeds/LinkResourceTerm.csv", :headers => true) do |row|
    link_terms << row.to_hash
  end
  link_terms
end

def get_regions_via_terms
  regions = []
  terms = get_terms
  link_terms = get_term_resource_links
  region_terms = terms.group_by{|term| term['region'] }.except('NULL')
  region_terms.each do |region_key, region_references|
    regions = terms.select{|term| term['key_term_id'] == region_key }
    regions.each do |region|
      if region['type'] == 'R'
        country = Country.where("name = ?", region['key_term']).first
      else
        subject = Subject.where("name = ?", region['key_term']).first
      end
      region_references.each do |region_term|
        region_links = link_terms.select{|term| term['link_to_term'] == region_term['key_term_id']}
        region_links.each do |matching_region_term|
          resource = Resource.where("resource_id = ?", matching_region_term['link_to_resource']).first
          unless resource.nil?
            if !country.nil?
              puts resource.id
              country.resource_ids = country.resource_ids << resource.id
              country.save
            elsif !subject.nil?
              puts subject.id
              resource.subject_ids = resource.subject_ids << subject.id
              resource.save
            end
          end
        end
      end
    end
  end
  regions
end

def get_united_states_terms
  us_terms = { }
  terms = []
  CSV.foreach("#{Rails.root}/db/seeds/KeyTerms.csv", :headers => true) do |row|
    terms << row.to_hash
  end
  terms.each do |term|
    term_split = term['key_term'].split(/-/)
    if term_split.size == 1
      ## united states as a Country
      if term['type'] == 'S'
        us_terms[term['key_term_id']] = term
      end
    end
  end
  us_terms
end



def get_relationships
  link_terms = []
  us_terms = get_united_states_terms
  CSV.foreach("#{Rails.root}/db/seeds/LinkResourceTerm.csv", :headers => true) do |row|
    link_terms << row.to_hash
    if us_terms.key?(row['link_to_term'])
      link_terms << { "link_to_term" => '29', "link_to_resource" => row.to_hash['link_to_resource'] }
    end
  end
  link_terms
end


processed_terms = get_terms
term_resource_links = get_relationships
subjects = []
countries = []

processed_terms.each do |term|
  if term['type'] == 'S'
    subjects << term
  elsif term['type'] == 'R'
    countries << term
  end
end

group_subjects = subjects.group_by{|term| term['key_term']}
group_countries = countries.group_by{|term| term['key_term']}


# get_links.each do |link|
#   puts link['link_to_resource']
#   puts link['link_to_term']
# end

group_subjects.each do |key, subject|
  puts key
  unless key.nil?
    subject_term = Subject.create({name: key})
    subject.each do |subject|
      puts subject['key_term_id']
      links = term_resource_links.select{|term| term['link_to_term'] == subject['key_term_id']}
      links.each do |link|
        resource = Resource.where("resource_id = ?", link['link_to_resource']).first
        if resource.nil?
          puts subject
          puts link
        else
          puts [ subject_term.id, link['link_to_resource'], resource.id, resource.resource_id ].to_s
          if resource.subject_ids.nil?
            resource.subject_ids = [subject_term.id]
          else
            resource.subject_ids = resource.subject_ids << subject_term.id
          end
        end
      end
    end
  end
end

group_countries.each do |key, subject|
  puts key
  unless key.nil?
    country = Country.create({name: key})
    subject.each do |subject|
      puts subject['key_term_id']
      links = term_resource_links.select{|term| term['link_to_term'] == subject['key_term_id']}
      links.each do |link|
        resource = Resource.where("resource_id = ?", link['link_to_resource']).first
        if resource.nil?
          puts subject
          puts link
        else
          puts [ country.id, link['link_to_resource'], resource.id, resource.resource_id ].to_s
          if country.resource_ids.nil?
            country.resource_ids = [resource.id]
          else
            country.resource_ids = country.resource_ids << resource.id
          end
        end
      end
    end
  end
end

# removing Canada
def region_ids
  [14,12,30,11,13,31,15,10]
end

## Add Region Relationships
terms_regions_map = get_regions_via_terms

## Build relationships btw countries + resources
# group_countries.each do |key, subject|
#   puts key
#   unless key.nil?
#     subject.each do |subject|
#       puts subject['key_term_id']
#       links = term_resource_links.select{|term| term['link_to_term'] == subject['key_term_id']}
#       puts links
#     end
#   end
# end
## Build relatiohships btw regions + resources
