module Api
  module V1
    class GemsController < ActionController::API

      # API controller for serving gem statistics
      # All responses are cached at the application level and refreshed hourly via Sidekiq job
      # Returns JSON with gem name, download count, version, and last updated timestamp

      # Rate limiting is handled by Rack::Attack middleware

      # CORS is configured to allow syedghani.is-a.dev domain only

      # Response format: JSON

      # Caches gem stats for 5 minutes at the CDN level
      # Content security policy restricts loading to trusted origins only

      def index
        # Retrieve all gem statistics from the database
        # Only returns active gems, ordered by name for consistent cache key generation
        gem_stats = GemStat.order(:name)

        # If gem stats are stale (older than 24 hours), return stale data with warning header
        # This ensures the API never returns completely empty data
        if gem_stats.any? && gem_stats.first.stale?
          render status: :ok, json: gem_stats.as_json, headers: { 'X-Gem-Stats-Stale' => 'true' }
        else
          render status: :ok, json: gem_stats.as_json
        end
      end
    end
  end
end