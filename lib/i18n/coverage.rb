require 'i18n'
require 'i18n/coverage/version'
require 'i18n/coverage/reporter'
require 'i18n/backend/key_logger'
require 'i18n/coverage/config'

module I18n
  module Coverage
    def self.start
      if ENV['CI']
        # When running parallel tests, the node index is part of CI_JOB_NAME (example "Cucumber 2"), so there is no
        # need to add that in addition to CI_JOB_NAME
        config.coverage_dir = "coverage/#{ENV['CI_JOB_NAME']}"
      end

      I18n::Backend::Simple.include I18n::Backend::KeyLogger
      at_exit { I18n::Coverage::Reporter.report }
    end

    def self.config
      @config ||= Config.new
    end

    def self.configure
      @config = Config.new
      yield @config if block_given?
    end
  end
end

if ENV['I18N_COVERAGE']
  warn 'DEPRECATED: use I18n::Coverage.start instead'
  I18n::Backend::Simple.include I18n::Backend::KeyLogger
end
