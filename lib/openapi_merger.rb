require "openapi_merger/error"
require "openapi_merger/base"
require "openapi_merger/json_merger"
require "openapi_merger/yaml_merger"
require "openapi_merger/version"

module OpenapiMerger
  class << self
    def call(options)
      return NoInputFileError unless options[:input]

      case File.extname options[:input].downcase
      when '.yaml', '.yml'
        OpenapiMerger::YAMLMerger.new(options).call
      when '.json'
        OpenapiMerger::JSONMerger.new(options).call
      else
        UnexpectedInputFileError
      end
    end
  end
end
