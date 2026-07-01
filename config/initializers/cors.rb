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

# Rack::Attack throttle rules (v6: return nil to allow, a string to count toward limit)

# General rate limiting — 30 req/5min per IP
Rack::Attack.throttle('req/ip', limit: 30, period: 5.minutes) do |req|
  req.ip unless Rails.env.development? || req.ip =~ /^127\.|^192\.168\.|^10\./
end

# Contact form: 3/hr per IP, with honeypot check
Rack::Attack.throttle("contact_form", limit: 3, period: 1.hour) do |req|
  if req.fullpath.match?(/api\/v1\/contact$/) && Rails.env.production?
    req.params.dig("contact_message", "name").blank? ? nil : req.ip
  end
end