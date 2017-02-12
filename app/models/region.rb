class Region < ApplicationRecord
  has_and_belongs_to_many :resources

  after_save :index_attached_records

  def index_attached_records
    resources = Region.includes(:resources).find(self.id).resources
    resources.each do |r|
      r.save!
    end
  end
end
