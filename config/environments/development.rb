WheelerBoard::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  dev_env_file = "#{Rails.root}/config/dev.yml"
  dev = YAML::load_file(dev_env_file)
  ENV['AWS_ACCESS_KEY_ID']     = dev['aws_key']
  ENV['AWS_SECRET_ACCESS_KEY'] = dev['aws_secret']
  ENV['AWS_BUCKET']            = dev['aws_bucket']
  ENV['GOOGLE_KEY']            = dev['google_key']
  ENV['GOOGLE_SECRET']         = dev['google_secret']

  keys = %w(aws_key aws_secret aws_bucket google_key google_secret)
  keys.each do |key|
    value = dev[key]
    if value.blank? || value == 'replace this'
      raise "Please set #{key} in #{Rails.root}/config/dev.yml"
    end
  end
end
