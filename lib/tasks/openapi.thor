# frozen_string_literal: true

require 'logger'
require 'openapi_merger'

class Openapi < Thor
  desc 'merge', 'Merge multiple OpenAPI documents to one OpenAPI document'

  def merge
    logger.info('merge task start')
    begin
      logger.info(OpenapiMerger.call)
    rescue StandardError => e
      logger.error(e)
    end
    logger.info('merge task finished')
  end

  private

  def logger
    @logger ||= Logger.new(STDOUT)
  end
end
