class Project < ApplicationRecord
  validates :name, presence: true
  belongs_to :manager
  has_many :task, dependent: :destroy
end
