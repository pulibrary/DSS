json.extract! data_file, :id, :legacy_id, :files, :size, :comp_size, :line_count, :line_length, :part, :file_type_a, :file_type_b, :flag_one, :flag_two, :file_type_a, :file_type_tech, :note, :study_num, :permission, :timestamp, :study_id, :created_at, :updated_at
json.url data_file_url(data_file, format: :json)
