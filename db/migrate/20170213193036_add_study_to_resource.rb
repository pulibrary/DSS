class AddStudyToResource < ActiveRecord::Migration[5.1]
  def change
    change_table :studies do |t|
      t.belongs_to :resource, index: true
    end
  end
end
