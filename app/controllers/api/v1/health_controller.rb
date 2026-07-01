module Api
  module V1
    class HealthController < ActionController::API
      def show
        api_key_set = RubygemsClient::API_KEY.present?
        gems_count = GemStat.count

        result = { api_key_set: api_key_set, gems_tracked: gems_count }

        begin
          gems = RubygemsClient.fetch_all
          result[:rubygems_connectivity] = "ok"
          result[:rubygems_gems_count] = gems.size
        rescue RubygemsClientError => e
          result[:rubygems_connectivity] = "error"
          result[:rubygems_error] = e.message
        end

        render status: :ok, json: result
      end
    end
  end
end