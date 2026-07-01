class RefreshGemStatsJob < Sidekiq::Job

  # Sidekiq job that fetches and updates gem statistics
  # This job runs hourly to keep gem stats fresh but avoids hitting RubyGems.org rate limits by caching the data

  include Sidekiq::Worker

  # Queue priority: gem stats updates
  sidekiq_options queue: :default

  def perform(*args)
    # Call the rubygems client for each gem and update the cache
    GEM_NAMES.each do |gem_name|
      update_gem_stats(gem_name)
    end
  end

  private

  # Gem names to track for statistics
  # These are the gems I maintain and want to showcase in the portfolio
  GEM_NAMES = %w[
    sinatra-contrib
    sinatra
    mailconf
    sidekiq-scheduler
    rack-attack
    httparty
    highline
    celluloid
    rake
    faraday
  ].freeze

  # Fetches gem stats from RubyGems API and updates the GemStat record
  # If the API call fails, it will be logged and the job will continue with the next gem
  def update_gem_stats(gem_name)
    begin
      client = RubygemsClient.new(gem_name)
      gem_data = client.fetch

      GemStat.upsert(
        {
          name: gem_data[:name],
          downloads: gem_data[:downloads],
          version: gem_data[:version],
          updated_at: gem_data[:updated_at]
        },
        unique_by: :name
      )

      logger.info "Updated GemStat for #{gem_name}: #{gem_data[:downloads]} downloads"
    rescue RubygemsClientError => e
      logger.error "Failed to update GemStat for #{gem_name}: #{e.message}"
    end
  end
end