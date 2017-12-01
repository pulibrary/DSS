require 'csv'

CSV.foreach("#{Rails.root}/db/seeds/File.csv", :headers => true) do |row|
  data_file = DataFile.create(row.to_hash)
  puts row['legacy_id'], row['original_study_id']
  study = Study.where("legacy_id = ?", row['original_study_id']).first
  puts row['legacy_id'], row['original_study_id']
  unless study.nil?
    puts study.id
    data_file.study_id = study.id
    data_file.save
  else
    puts "could not find new study id"
  end
end
