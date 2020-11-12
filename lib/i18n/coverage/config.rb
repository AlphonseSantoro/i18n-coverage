require 'i18n/coverage/printers/basic_printer'

module I18n
  module Coverage
    class Config
      attr_accessor :locale,
                    :locale_dir_path,
                    :printer,
                    :coverage_dir

      def initialize
        self.locale = 'en'
        self.locale_dir_path = 'config/locales'
        self.coverage_dir = 'coverage'
        self.printer = I18n::Coverage::Printers::BasicPrinter
      end
    end
  end
end
