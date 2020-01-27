module OpenapiMerger
  module Merger
    class Base
      def initialize(options)
        @options = options
      end

      def call
        YAML.dump inputfile
      end

      attr_reader :options

      private

      def inputfile
        input2yaml
      end

      def input2yaml
        raise NotImplementedError, "Implement method"
      end

      def file
        File.open options[:input]
      end
    end
  end
end
