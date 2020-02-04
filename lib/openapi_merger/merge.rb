# frozen_string_literal: true

module OpenapiMerger
  class Merge
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
        replace(object) if object.key?(reference_keyword)

        object.keys.map do |key|
          [
            key,
            turn_around(object.fetch(key))
          ]
        end.to_h
      when Array
        object.map do |elm|
          turn_around(elm)
        end
      else
        object
      end
    end

    def reference_keyword
      '$ref'
    end

    def replace(object)
      object.merge!(
        relational_input(object.fetch(reference_keyword))
      )
      object.delete(reference_keyword)
    end

    def relational_input(filepath)
      ::OpenapiMerger::Input.new(
        input: target_path(filepath)
      ).call
    end

    def target_path(filepath)
      File.join(target_dir, filepath)
    end

    def target_dir
      File.dirname(options[:input])
    end
  end
end
