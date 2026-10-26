class Region < ApplicationRecord
  has_and_belongs_to_many :countries
  after_save :index_attached_records

  def index_attached_records
    if self.countries.any?
      Resource.where(countries: self.countries).each { it.save! }
    end
  end
end
