require 'json'

module OpenapiMerger
  class JSONMerger < OpenapiMerger::Base
    private

    def input2json
      JSON.load inputfile.read
    end
  end
end
