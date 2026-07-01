class RubygemsClient
  API_KEY = ENV["RUBYGEMS_API_KEY"]
  BASE_URL = "https://rubygems.org/api/v1/gems"

  def self.fetch_all
    raise RubygemsClientError, "RUBYGEMS_API_KEY is required" unless API_KEY

    response = HTTParty.get("#{BASE_URL}.json", headers: { "Authorization" => API_KEY })

    unless response.success?
      raise RubygemsClientError, "Failed to fetch gems: #{response.code}"
    end

    response.parsed_response.map do |data|
      {
        name: data["name"],
        downloads: data["downloads"].to_i,
        version: data["version"],
        updated_at: Time.parse(data["version_created_at"])
      }
    end
  end
end

class RubygemsClientError < StandardError; end