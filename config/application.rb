require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require "action_mailbox/engine"
# require "action_text/engine"
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

require_relative '../lib/helpers'
require_relative '../lib/schema_statements'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

unless Rails.env.production?
  Dotenv.load(".env.#{Rails.env}.local",
              ".env.#{Rails.env}",
              '.env.local',
              '.env')
end

module Releasely
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.generators do |g|
      g.test_framework nil
      g.assets false
      g.helper false
      g.stylesheets false
      g.javascripts false
    end

    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    # Rails.logger = Logger.new(STDOUT)
    ActiveRecord::ConnectionAdapters::AbstractAdapter.include Releasely::SchemaStatements

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: ENV.fetch('SMTP_SERVER') { 'localhost' },
      port: (ENV.fetch('SMTP_PORT') { '2525' }).to_i
    }
    config.action_mailer.default_options = { from: ENV.fetch('MAILER_DEFAULT_FROM') { 'no-reply@example.com' },
                                             to: ENV.fetch('MAILER_DEFAULT_TO') { 'catch-all@localhost' } }
  end
end
