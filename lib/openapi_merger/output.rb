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

    def outputfile
      File.open filepath, 'w'
    end

    def build_yaml(output)
      return unless output.kind_of?(Hash)

      YAML.dump(output, outputfile)
    end

    def build_json(output)
      return unless output.kind_of?(Hash)

      outputfile.puts(JSON.pretty_generate(output))
    end

    def build_unsupported
      raise OpenapiMerger::UnsupportedFileTypeError
    end
  end
end
