# frozen_string_literal: true

require 'dotenv/load'

require 'openapi_merger/error'
require 'openapi_merger/input'
require 'openapi_merger/merge'
require 'openapi_merger/output'
require 'openapi_merger/version'

module OpenapiMerger
  class << self
    def call
      merged = merge(input.call).call
      output.call(merged)
    end

    private

    def merge(origin)
      OpenapiMerger::Merge.new(options, origin)
    end

    def input
      @input ||= OpenapiMerger::Input.new(options)
    end

    def output
      @output ||= OpenapiMerger::Output.new(options)
    end

    def options
      @options ||= {
        input: input_file,
        output: output_file
      }.compact
    end

    def input_file
      @input_file ||= ENV['INPUT_FILE']
    end

    def output_file
      @output_file ||= ENV['OUTPUT_FILE']
    end
  end
end
