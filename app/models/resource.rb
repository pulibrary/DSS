class Resource < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :regions

  def as_json(options={})
    to_solr.to_json
  end

  def to_solr
    solr_doc = {}
    attributes.each_pair do |name,value|
      solr_doc[name] = value
    end
    subject_values = []
    subjects.each do |subject|
      subject_values << subject.name    
    end
    solr_doc['subjects'] = subject_values
    country_values = []
    countries.each do |country|
      country_values << country.name
    end
    solr_doc['countries'] = country_values
    solr_doc
  end

  def subjects
    subjects = Subject.find(self.subject_ids).sort_by{ |subject| subject.name }
  end

  def countries
    countries = Country.find(self.country_ids).sort_by{ |country| country.name }
  end

  def regions
    regions = Region.find(self.region_ids).sort_by{ |region| region.name }
  end

  private

    def solr_mapping
    end

end
