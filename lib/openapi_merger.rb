# frozen_string_literal: true

require 'dotenv/load'

require 'openapi_merger/error'
require 'openapi_merger/input'
require 'openapi_merger/output'
require 'openapi_merger/version'

module OpenapiMerger
  class << self
    def call
      parsed_input = OpenapiMerger::Input.new(options).call
      OpenapiMerger::Output.new(options).call(parsed_input)
    end

    private

    def options
      {
        input: input,
        output: output
      }.compact
    end

    def input
      ENV['INPUT_FILE']
    end

    def output
      ENV['OUTPUT_FILE']
    end
  end
end
