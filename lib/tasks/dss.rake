require 'json'

namespace :dss do

  namespace :terms do
    desc 'Bulk assigns a country term id to a subject term id' 
    task :country_to_subject, [:country_id, :subject_id] => :environment do |t, args|
      puts "#{args[:country_id]}"
      country = Country.find(args[:country_id])
      puts country.name
      subject = Subject.find(args[:subject_id])
      puts subject.name
      resources = Country.includes(:resources).find(args[:country_id]).resources
      puts resources.size
      resources.each do |r|
        subjects = r.subject_ids.push(args[:subject_id].to_i)
        puts subjects.to_s
        r.subject_ids = subjects
        r.save!
        r.reload
        r.country_ids.delete(args[:country_id].to_i)
        r.country_ids = r.country_ids
        r.save!
        puts "updating #{r.id}"
      end
    end

  end

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

    desc 'Reindexes all current Resource objects'
    task reindex: :environment do
      resources = Resource.all
      resources.each do |r|
        r.save!
        puts "index rid: #{r.id}"
      end
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

    desc 'Copy solr config files to Jetty wrapper'
    task solr2jetty: :environment do
      #cp Rails.root.join('solr_conf','solr.xml'), Rails.root.join('jetty','solr')
      cp Rails.root.join('solr_conf','schema.xml'), Rails.root.join('jetty','solr','blacklight-core','conf')
      cp Rails.root.join('solr_conf','solrconfig.xml'), Rails.root.join('jetty','solr','blacklight-core','conf')
      unless File.exists?(Rails.root.join('jetty','solr','blacklight-core','conf','lang'))
        Dir.mkdir(Rails.root.join('jetty','solr','blacklight-core','conf','lang'))
      end
      Dir.glob(Rails.root.join('solr_conf','lang','*')).each do |lang_file|
        cp lang_file, Rails.root.join('jetty','solr','blacklight-core','conf', 'lang')
      end
    end
  end

  private

    def url_for_file(file)
      "https://raw.githubusercontent.com/pulibrary/pul_solr/master/solr_configs/orangelight/#{file}"
    end
end