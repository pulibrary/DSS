require 'json'

namespace :dss do

  namespace :solr do
    
    desc 'Posts fixtures to Solr'
    task :index do
      solr = RSolr.connect :url => Blacklight.connection_config[:url]
      resource_list = Resource.all.map { |r| r.to_solr }
      solr.add JSON.parse(resource_list)
      solr.update data: '<commit/>'
    end

    desc 'Delete fixtures from Solr'
    task :deindex do
      solr = RSolr.connect :url => Blacklight.connection_config[:url]
      solr.update data: '<delete><query>*:*</query></delete>'
      solr.update data: '<commit/>'
    end
  end
end