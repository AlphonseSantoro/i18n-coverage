module I18n
  module Coverage
    module Printers
      class FilePrinter
        attr_accessor :report_path

        def self.print(report)
          new(report).print
        end

        def initialize(report)
          @report = report
          @report_path = "#{I18n::Coverage.config.coverage_dir}/i18n.json"
        end

        def print
          write_report
          print_message
        end

        def write_report
          FileUtils.mkdir_p(File.dirname(@report_path))
          File.write(@report_path, JSON.pretty_generate(@report))
        end

        def print_message
          puts "Coverage report generated for I18n to #{@report_path}. " \
            "#{@report[:used_key_count]} / #{@report[:key_count]} keys " \
            "(#{@report[:percentage_used].round(2)}%) covered."
        end
      end
    end
  end
end
