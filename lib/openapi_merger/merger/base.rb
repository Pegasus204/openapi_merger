module OpenapiMerger
  module Merger
    class Base
      def initialize(options)
        @options = options
      end

      def call
        YAML.dump input
      end

      attr_reader :options

      private

      def input
        input2yaml
      end

      def input2yaml
        raise NotImplementedError, "Implement method"
      end

      def inputfile
        File.open options[:input]
      end
    end
  end
end
