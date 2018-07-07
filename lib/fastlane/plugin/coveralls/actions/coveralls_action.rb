require 'fastlane/action'
require_relative '../helper/coveralls_helper'

module Fastlane
  module Actions
    class CoverallsAction < Action
      def self.run(params)
        Actions.verify_gem!('xccoveralls')
        require 'xccoveralls'
        require 'xccoveralls/runner'

        Xccoveralls::Runner.new(params.values).run!
      end

      def self.description
        "Send coverage information to Coveralls"
      end

      def self.authors
        ["Atsushi Nagase"]
      end

      def self.details
        "Send coverage information to Coveralls\n" \
          "Make sure `Gather coverage` is turned on for your test target.\n" \
          "More informmation: [https://github.com/ngs/xccoveralls](https://github.com/ngs/xccoveralls)"
      end

      def self.available_options
        return [] unless Helper.mac?
        require 'fastlane/core_ext/bundler_monkey_patch'

        begin
          Gem::Specification.find_by_name('xccoveralls')
        rescue Gem::LoadError
          return []
        end

        require 'xccoveralls/options'
        Xccoveralls::Options.available_options
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end

      def self.example_code
        [
          'coveralls(
            repo_token: "(secret)",
            derived_data_path: "your/custom/DerivedData",
            source_path: "your/src",
            ignorefile_path: "your/src/.coverallsignore"
          )'
        ]
      end

      def self.category
        :testing
      end
    end
  end
end
