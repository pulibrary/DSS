class CreateDataFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :data_files do |t|
      t.integer :legacy_id
      t.string :files
      t.string :size
      t.decimal :comp_size
      t.string :line_count
      t.string :line_length
      t.string :part
      t.string :file_type_a
      t.string :file_type_b
      t.string :flag_one
      t.string :flag_two
      t.string :file_type_a
      t.string :file_type_tech
      t.string :note
      t.integer :study_num
      t.string :permission
      t.timestamp :timestamp
      t.integer :original_study_id
      t.belongs_to :study, index: true
      t.timestamps
    end
  end
end
