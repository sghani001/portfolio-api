class Experience < ApplicationRecord
  validates :company, presence: true

  scope :ordered, -> { order(position: :asc) }
end