module OpenapiMerger
  class Base
    def initialize(options)
      @options = options
    end

    def call
      JSON.generate input
    end

    attr_reader :options

    private

    def input
      input2yaml
    end

    def input2json
      raise NotImplementedError, "Implement method"
    end

    def inputfile
      File.open options[:input]
    end
  end
end
