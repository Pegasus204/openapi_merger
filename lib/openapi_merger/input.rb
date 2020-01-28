# frozen_string_literal: true

require 'json'
require 'yaml'

module OpenapiMerger
  class Input
    def initialize(options)
      @options = options
    end

    def call
      send("parse_#{filetype}")
    end

    attr_reader :options

    private

    def filepath
      options[:input]
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

    def inputfile
      File.open(filepath, 'r')
    end

    def input
      inputfile.read
    end

    def parse_yaml
      YAML.safe_load(input)
    end

    def parse_json
      JSON.parse(input)
    end

    def parse_unsupported
      raise OpenapiMerger::UnsupportedFileTypeError
    end
  end
end
