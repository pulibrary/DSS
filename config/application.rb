require_relative 'boot'

require 'rails/all'
require 'susy'
require 'breakpoint'
require_relative "lando_env"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DssCatalog
  class Application < Rails::Application
    config.active_support.cache_format_version = 7.0
    config.load_defaults 6.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('app/assets/fonts')
    config.autoloader = :zeitwerk

    # See https://github.com/projectblacklight/blacklight/issues/2768
    config.active_record.yaml_column_permitted_classes = [HashWithIndifferentAccess]
  end
end
