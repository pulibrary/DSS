class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :key_term_id
      t.timestamp :key_time

      t.timestamps
    end

    create_table :regions_resources, id: false do |t|
      t.belongs_to :region, index: true
      t.belongs_to :resource, index: true
    end

    create_table :regions_studies, id: false do |t|
      t.belongs_to :region, index: true
      t.belongs_to :study, index: true
    end
  end
end
