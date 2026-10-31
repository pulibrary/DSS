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

  def self.merge_countries(old:, new:)
    resources = old.resources | new.resources
    new.update(regions: old.regions | new.regions, resources:)
    resources.each { it.update(countries: it.countries - [old]) }

    studies_to_update = Study.joins(:countries).where(countries: old)
    studies_to_update.each { it.update(countries: it.countries + [new] - [old]) }

    old.destroy
  end
end
