class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :key_term_id
      t.timestamp :key_time

      t.timestamps
    end

    create_table :countries_resources, id: false do |t|
      t.belongs_to :country, index: true
      t.belongs_to :resource, index: true
    end
  end
end
