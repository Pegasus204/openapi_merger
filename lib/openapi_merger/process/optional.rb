# frozen_string_literal: true

module OpenapiMerger
  module Process
    class Optional
      def initialize(options)
        @options = options
      end

      attr_reader :options

      def call(origin)
        turn_around(origin)
      end

      private

      def turn_around(object)
        case object
        when Hash
          replace(object) if object.keys.include?('properties')
          object.keys.map do |key|
            [
              key,
              turn_around(object[key])
            ]
          end.to_h
        when Array
          object.map do |elm|
            turn_around(elm)
          end
        else
          object
        end
        object
      end

      def replace(object)
        candidates = object['properties'].keys.map do |key|
          if object['properties'][key].key?('optional')
            object['properties'][key].delete('optional')
            nil
          else
            key
          end
        end.compact

        object['required'] = candidates
        object
      end
    end
  end
end
