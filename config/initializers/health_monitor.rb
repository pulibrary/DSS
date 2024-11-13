# frozen_string_literal: true

Rails.application.config.after_initialize do
  HealthMonitor.configure do |config|
    config.cache

    config.solr.configure do |c|
      c.url = Blacklight.default_index.connection.uri.to_s
    end
    config.file_absence.configure do |file_config|
      file_config.filename = "public/remove-from-nginx"
    end

    # Make this health check available at /health
    config.path = :health

    config.error_callback = proc do |e|
      Rails.logger.error "Health check failed with: #{e.message}"
      Honeybadger.notify(e) unless e.is_a?(HealthMonitor::Providers::FileAbsenceException)
    end
  end
end
