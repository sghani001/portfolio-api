class RefreshGemStatsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    gems = RubygemsClient.fetch_all

    gems.each do |gem_data|
      GemStat.upsert(
        {
          name: gem_data[:name],
          downloads: gem_data[:downloads],
          version: gem_data[:version],
          updated_at: gem_data[:updated_at]
        },
        unique_by: :name
      )
    end

    active_names = gems.map { |g| g[:name] }
    GemStat.where.not(name: active_names).destroy_all
  rescue RubygemsClientError => e
    logger.error "Failed to sync gems: #{e.message}"
  end
end