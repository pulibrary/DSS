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

    desc 'Updates solr config files from github'
    task :update, :solr_dir do |t, args|
      solr_dir = args[:solr_dir] || Rails.root.join('solr')

      ['mapping-ISOLatin1Accent.txt', 'protwords.txt', 'schema.xml', 'solrconfig.xml',
       'spellings.txt', 'stopwords.txt', 'stopwords_en.txt', 'synonyms.txt',
       'CJKFoldingFilter.jar', 'lucene-umich-solr-filters-6.0.0-SNAPSHOT.jar'].each do |file|
        response = Faraday.get url_for_file("conf/#{file}")
        File.open(File.join(solr_dir, 'conf', file), 'wb') { |f| f.write(response.body) }
      end
    end
  end


  private

    def url_for_file(file)
      "https://raw.githubusercontent.com/pulibrary/pul_solr/master/solr_configs/orangelight/#{file}"
    end
end