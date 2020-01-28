# frozen_string_literal: true

require 'json'
require 'yaml'

module OpenapiMerger
  class Output
    def initialize(options)
      @options = options
    end

    def call(output)
      send("build_#{filetype}", output)
    end

    attr_reader :options

    private

    def filepath
      options[:output]
    end

    def filetype
      case File.extname(filepath).downcase
      when '.yaml', '.yml'
        :yaml
      when '.json'
        :json
      else
        :unsupported
      end
    end

    def build_yaml(output)
      return unless output.is_a?(Hash)

      File.write(filepath, YAML.dump(output))
    end

    def build_json(output)
      return unless output.is_a?(Hash)

      File.write(filepath, JSON.pretty_generate(output))
    end

    def build_unsupported
      raise OpenapiMerger::UnsupportedFileTypeError
    end
  end
end
