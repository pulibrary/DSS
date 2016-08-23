class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :resource_id
      t.string :url
      t.text :blurb
      t.timestamp :link_time
      t.string :sample
      t.string :principal_investigator
      t.string :producer
      t.string :distributor
      t.string :version
      t.string :more_detail_url
      t.string :resource_type

      t.timestamps
    end
  end
end
