require 'json'

module OpenapiMerger
  module Merger
    class JSONMerger < OpenapiMerger::Merger::Base
      private

      def input2json
        JSON.load inputfile.read
      end
    end
  end
end
