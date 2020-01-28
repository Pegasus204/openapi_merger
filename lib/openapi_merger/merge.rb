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
        object.keys.map do |key|
          replace(object) if key == '$ref'
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
      object.replace(
        relational_input(object.values.first)
      )
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
