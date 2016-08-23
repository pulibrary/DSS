class Resource < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :regions
end
