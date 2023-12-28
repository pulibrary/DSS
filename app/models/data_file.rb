class DataFile < ApplicationRecord
  belongs_to :study, optional: true
end
