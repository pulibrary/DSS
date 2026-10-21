class Resource < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :countries

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
        solr_doc["format"] = [ value ]
      elsif name == 'url'
        solr_doc["url_s"] = value
      elsif name == 'blurb'
        unless value.nil?
          solr_doc["blurb_t"] = value.delete('\\')
        end
      else
        solr_doc["#{name}_t"] = [ value ]
      end
    end
    solr_doc['subject_topic_facet'] = subjects.map(&:name)
    solr_doc['subject_geo_facet'] = countries.map(&:name)
    solr_doc['hierarchical_country_facet'] = countries_with_regions.flat_map do |country|
      if country.regions.any?
        country.regions.flat_map { |region| [region.name, "#{region.name}|||#{country.name}"] }
      else
        country.name
      end
    end.uniq
    solr_doc
  end

  def catalog_id
    "resource#{self.id}"
  end

  def index_record
    solr = RSolr.connect(url: solr_url)
    solr.add self.to_solr # :headers => {"Content-Type"=>"application/json"})
    solr.commit
  end

  def remove_from_index
    solr = RSolr.connect(url: solr_url)
    solr.delete_by_id(catalog_id)
    solr.commit
  end

  def study
    studies = Study.where(resource_id: self.id)
    if studies.size == 1
      studies.first
    end
  end

  def subjects
    Subject.find(self.subject_ids).sort_by{ |subject| subject.name }
  end

  def countries_with_regions
    Country.left_outer_joins(:regions).find(country_ids).sort_by{ |country| country.name }
  end

  protected
    def solr_url
      Blacklight.blacklight_yml[Rails.env]['url'].to_s
    end

end
