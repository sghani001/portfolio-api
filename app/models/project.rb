class Project < ApplicationRecord
  validates :title, presence: true

  scope :ordered, -> { order(position: :asc, created_at: :desc) }
  scope :featured, -> { where(featured: true).ordered }
end