require 'yaml'

module OpenapiMerger
  class YAMLMerger < OpenapiMerger::Base
    private

    def input2json
      YAML.load inputfile.read
    end
  end
end
