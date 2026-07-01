class GemStat < ApplicationRecord
  # Rails Model for storing cached gem stats

  # 'name' identifies which Ruby gem we tracked (e.g., "sinatra")
  validates :name, presence: true, uniqueness: true

  # 'downloads' stores the total download count from RubyGems.org API
  validates :downloads, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # 'version' identifies the gem version we cached (e.g., "2.2.19")
  validates :version, presence: true

  # 'updated_at' tracks when this record was last refreshed
  validates :updated_at, presence: true

  # Helper method to check if stats are stale (older than 24 hours)
  def stale?
    updated_at < 24.hours.ago
  end
end