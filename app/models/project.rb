class Project < ApplicationRecord
  validates :name, presence: true
  belongs_to :manager
end
