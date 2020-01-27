require "openapi_merger/error"
require "openapi_merger/merger/base"
require "openapi_merger/merger/json_merger"
require "openapi_merger/merger/yaml_merger"
require "openapi_merger/version"

module OpenapiMerger
  class << self
    def call(options)
      return NoInputFileError unless options[:input]

      case File.extname options[:input].downcase
      when '.yaml', '.yml'
        OpenapiMerger::Merger::YAMLMerger.new(options).call
      when '.json'
        OpenapiMerger::Merger::JSONMerger.new(options).call
      else
        UnexpectedInputFileError
      end
    end
  end
end
