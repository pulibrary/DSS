class Country < ApplicationRecord
  has_and_belongs_to_many :resources
  has_and_belongs_to_many :regions

  after_save :index_attached_records

  def index_attached_records
    resources = Country.includes(:resources).find(self.id).resources
    resources.each do |r|
      r.save!
    end
  end
end
