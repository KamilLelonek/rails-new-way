require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'

Bundler.require(*Rails.groups)

module RailsNewWay
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
