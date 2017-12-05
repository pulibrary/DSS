class CreateStudies < ActiveRecord::Migration[5.1]
  def change
    create_table :studies do |t|
      t.integer :legacy_id
      t.integer :studynum
      t.string :title
      t.string :medium
      t.string :icpsr_num
      t.string :url
      t.string :directory
      t.string :folder
      t.boolean :r_flag
      t.timestamp :timestamp
      t.boolean :auto_refresh
      t.text :note
      t.string :roper
      t.integer :voyager_id

      t.timestamps
    end
  end
end
