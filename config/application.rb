require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.time_zone = 'Beijing'

    config.i18n.load_path += Dir[Rails.root.join('config','locales', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :'zh-CN'

    config.active_record.raise_in_transactional_callbacks = true
  end
end
