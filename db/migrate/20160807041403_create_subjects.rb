class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :key_term_id
      t.timestamp :key_time

      t.timestamps
    end


    create_table :resources_subjects, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :resource, index: true
    end

    create_table :studies_subjects, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :study, index: true
    end
  end
end
