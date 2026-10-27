class CountryRegionChecks < ActiveRecord::Migration[8.1]
  def change
    add_index :countries, [:name], unique: true
    add_index :regions, [:name], unique: true
    change_column_null :countries, :name, false
    change_column_null :regions, :name, false
  end
end
