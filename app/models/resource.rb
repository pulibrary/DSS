class Resource < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :regions

  # remove until import is taken care of.
  after_save :index_record
  before_destroy :remove_from_index

  def as_json(options={})
    to_solr.to_json
  end

  def to_solr
    solr_doc = {}
    attributes.each_pair do |name,value|
      if name == 'id'
        solr_doc['id'] = "resource#{value}"
      elsif name == 'name'
        solr_doc["title_t"] = [ value ]
        solr_doc["title_display"] = value
        solr_doc["title_sort"] = value
      elsif name == 'resource_type'
        solr_doc["resource_type_s"] = value
      elsif name == 'url'
        solr_doc["url_s"] = value
      elsif name == 'blurb'
        unless value.nil?
          solr_doc["blurb_t"] = value.gsub('\\', '')
        end
      else
        solr_doc["#{name}_t"] = [ value ]
      end
    end
    subject_values = []
    subjects.each do |subject|
      subject_values << subject.name    
    end
    solr_doc['subject_topic_facet'] = subject_values
    country_values = []
    countries.each do |country|
      country_values << country.name
    end
    solr_doc['subject_geo_facet'] = country_values
    solr_doc
    region_values = []
    regions.each do |region|
      region_values << region.name
    end
    solr_doc['region_facet'] = region_values
    solr_doc
  end

  def index_record
    solr = RSolr.connect(url: solr_url)
    solr.add self.to_solr #:headers => {"Content-Type"=>"application/json"})
    solr.commit
  end

  def remove_from_index
    solr = RSolr.connect(url: solr_url)
    solr.delete_by_id(self.id)
    solr.commit
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

  protected
    def solr_url
      "#{Blacklight.blacklight_yml[Rails.env]['url']}"
    end

end
