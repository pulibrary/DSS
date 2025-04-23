require 'json'

namespace :servers do
  desc "Start solr and postgres servers using lando."
  task start: :environment do
    system("lando start")
    system("rake db:create")
    system("rake db:migrate")
    system("rake db:migrate RAILS_ENV=test")
  end
end

namespace :dss do
  namespace :terms do
    desc 'Bulk assigns a country term id to a subject term id'
    task :country_to_subject, [:country_id, :subject_id] => :environment do |t, args|
      puts (args[:country_id])
      country = Country.find(args[:country_id])
      puts country.name
      subject = Subject.find(args[:subject_id])
      puts subject.name
      resources = Country.includes(:resources).find(args[:country_id]).resources
      puts resources.size
      resources.each do |r|
        subjects = r.subject_ids.push(args[:subject_id].to_i)
        puts subjects
        r.subject_ids = subjects
        r.save!
        r.reload
        r.country_ids.delete(args[:country_id].to_i)
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
        if !r.url.nil? && dss_url = /(^http:\/\/dss.princeton.edu\/cgi-bin\/catalog\/search.cgi\?studyno=)(\d+)/.match(r.url)
          studynum = dss_url[2]
            study = Study.find_by(studynum: studynum.to_s)
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

  namespace :solr do

    desc 'Send all Resource objects to Solr at once for indexing'
    task :index, [:collection] => :environment do |t, args|
      args.with_defaults(:collection => Blacklight.connection_config[:collection])
      solr = RSolr.connect :url => "#{Blacklight.connection_config[:url]}#{args[:collection]}"
      resource_list = Resource.all.map { |r| r.to_solr }
      solr.add JSON.parse(resource_list.to_json)
      solr.update data: '<commit/>', headers: { 'Content-Type' => 'text/xml' }
    end

    desc 'Delete all indexed Resource objects from Solr'
    task deindex: :environment do
      solr = RSolr.connect :url => "#{Blacklight.connection_config[:url]}#{Blacklight.connection_config[:collection]}"
      solr.update data: '<delete><query>*:*</query></delete>', headers: { 'Content-Type' => 'text/xml' }
      solr.update data: '<commit/>', headers: { 'Content-Type' => 'text/xml' }
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
    task :update, [:solr_dir] => :environment do |t, args|
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
      "https://raw.githubusercontent.com/pulibrary/pul_solr/main/solr_configs/dss-production/#{file}"
    end
end
