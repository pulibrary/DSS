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

  namespace :studies do
    desc 'Assign resource ids to subjects based on study number'
    task resource_study_map: :environment do
      resources = Resource.all
      resources.each do |r|
        unless r.url.nil?
          if dss_url = /(^http:\/\/dss.princeton.edu\/cgi-bin\/catalog\/search.cgi\?studyno\=)(\d+)/.match(r.url)
            studynum = dss_url[2]
            study = Study.where(studynum: "#{studynum}").take
            unless study.nil?
              puts "matching study num #{studynum} with study id #{study.id}"
              study.resource_id = r.id
              study.save!
              study.reload
            end
          end
        end
      end
    end
  end

  namespace :solr do

    desc 'Send all Resource objects to Solr at once for indexing'
    task index: :environment do
      solr = RSolr.connect :url => Blacklight.connection_config[:url]
      resource_list = Resource.all.map { |r| r.to_solr }
      solr.add JSON.parse(resource_list.to_json)
      solr.update data: '<commit/>'
    end

    desc 'Delete all indexed Resource objects from Solr'
    task deindex: :environment do
      solr = RSolr.connect :url => Blacklight.connection_config[:url]
      solr.update data: '<delete><query>*:*</query></delete>'
      solr.update data: '<commit/>'
    end

    desc 'Reindexes all current Resource objects one by one'
    task reindex: :environment do
      resources = Resource.all
      resources.each do |r|
        r.save!
        puts "index rid: #{r.id}"
      end
    end

    desc 'Updates solr config files from github [Use only for local development]'
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
      "https://raw.githubusercontent.com/pulibrary/pul_solr/master/solr_configs/catalog-production/#{file}"
    end
end
