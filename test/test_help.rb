require 'dotenv'
Dotenv.load

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "./dummy/config/environment"
require "rails"
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

require "rails/test_unit/reporter"
Rails::TestUnitReporter.executable = "bin/test"

require "yaml"
SERVICE_CONFIGURATIONS = begin
  erb = ERB.new(Pathname.new(File.expand_path("configurations.yml", __dir__)).read)
  configuration = YAML.load(erb.result) || {}
  configuration.deep_symbolize_keys
rescue Errno::ENOENT
  puts "Missing service configuration file in test/service/configurations.yml"
  {}
end