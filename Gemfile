source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.3"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors"
# Rate limiting for API endpoints
gem "rack-attack"
# RubyGems API client
gem "httparty"

# Authentication
gem "devise", "~> 5.0"
gem "devise-jwt", "~> 0.11"

# Solid Queue — database-backed background jobs (free on Render, no Redis needed)
# Recurring schedule is configured in config/recurring.yml

# Email delivery via Resend SMTP (free, 3k emails/month, no gem needed — pure Rails SMTP)
# Sign up free at https://resend.com and set RESEND_API_KEY in Render env vars.
gem "mail", "~> 2.0"

# API documentation - Swagger UI for testing endpoints
gem "rswag-api", "~> 2.16", require: "rswag/api"
gem "rswag-ui", "~> 2.16", require: "rswag/ui"

# Load .env in development/test
gem "dotenv-rails", "~> 3.0", groups: [:development, :test]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Preview emails in the browser instead of sending — no SMTP needed locally
  gem "letter_opener"

  # Audits gems for known security defects (use config/bundler-audit.yml to ignore issues)
  gem "bundler-audit", require: false

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # rswag specs generator
  gem "rswag-specs", "~> 2.16"
end
