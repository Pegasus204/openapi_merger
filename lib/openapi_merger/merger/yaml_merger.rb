require 'yaml'

module OpenapiMerger
  module Merger
    class YAMLMerger < OpenapiMerger::Merger::Base
      private

      def input2json
        YAML.load inputfile.read
      end
    end
  end
end
