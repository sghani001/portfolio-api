class RubygemsClient

  attr_reader :name

  def initialize(name)
    @name = name
  end

  # Fetches gem metadata from rubyGems.org API v1 and extracts needed data
  # Returns a hash with name, downloads, version, and updated_at
  # If the API returns an error, raises RubygemsClientError
  def fetch
    response = HTTParty.get("https://rubygems.org/api/v1/gems/#{name}.json")

    unless response.success?
      raise RubygemsClientError, "Failed to fetch gem data for #{name}: #{response.code}"
    end

    data = response.parsed_response

    {
      name: data["name"],
      downloads: data["downloads"].to_i,
      version: data["version"],
      updated_at: Time.parse(data["version_downloads"].first["last_updated"])
    }
  end
end

# Custom exception to handle errors from the RubyGems API
class RubygemsClientError < StandardError; end