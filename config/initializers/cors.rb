# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'syedghani.is-a.dev'
    resource '/api/v1/*', headers: :any, methods: [:get, :post, :options]
  end
end

# Add Rack::Attack middleware for rate limiting
config.middleware.use Rack::Attack

# Configure Rack::Attack
Rack::Attack.configure do
  # Skip rate limiting in development
  skip :development?

  # General rate limiting
  throttle('req/ip', limit: 30, period: 5.minutes) do |req|
    if req.ip =~ /localhost|127\.0\.0\.1/ || req.ip =~ /192\.168/ || req.ip =~ /10\./
      Rack::Attack::ALLOW
    else
      Rack::Attack.throttle('req/ip', limit: 30, period: 5.minutes)[req.ip] == :allow ? Rack::Attack::ALLOW : Rack::Attack::REJECT
    end
  end
end

# Contact form rate limiting with honeypot
Rack::Attack.throttle("contact_form", limit: 3, period: 1.hour) do |req|
  # Only apply to contact endpoint
  if !req.fullpath.match(/api\/v1\/contact$/) || Rails.env.development? || req.params.dig("contact_message", "name").blank?
    Rack::Attack::ALLOW
  else
    Rack::Attack::REJECT
  end
end