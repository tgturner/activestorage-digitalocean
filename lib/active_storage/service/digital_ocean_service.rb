# frozen_string_literal: true

require "active_storage/service/s3_service"

module ActiveStorage
  # Wraps the DigitalOcean Spaces as an Active Storage service.
  # See ActiveStorage::Service for the generic API documentation that applies to all services.
  class Service::DigitalOceanService < Service::S3Service
    def initialize(space_name:, upload: {}, **options)
      options[:access_key_id] = options.delete(:spaces_access_key)
      options[:secret_access_key] = options.delete(:spaces_secret_key)

      raise ActiveStorage::UnavailableConfigurationError if upload[:server_side_encryption]

      super(bucket: space_name, upload: upload, **options)
    end
  end
end
