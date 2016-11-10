class Study < ApplicationRecord
  has_many :data_files
  accepts_nested_attributes_for :data_files
end
