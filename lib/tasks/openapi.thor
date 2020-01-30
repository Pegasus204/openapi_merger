# frozen_string_literal: true

require 'dotenv/load'
require 'logger'
require 'openapi_merger'
require 'filewatcher'

class Openapi < Thor
  desc 'watch', 'Merge multiple OpenAPI documents to one OpenAPI document on file changed'

  def watch
    logger = Logger.new(STDOUT)
    logger.info('file-watch task start')

    puts target_dir

    begin
      Filewatcher.new([target_dir]).watch do |filename, event|
        puts "File #{event}: " + filename
        logger.info(OpenapiMerger.call)
      end
    rescue StandardError => e
      logger.error(e)
    end
    logger.info('file-watch task finished')
  end

  private

  def target_dir
    File.dirname(input_file)
  end

  def input_file
    @input_file ||= ENV['INPUT_FILE']
  end
end
