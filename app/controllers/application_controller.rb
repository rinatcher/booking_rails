# frozen_string_literal: true

class ApplicationController < ActionController::Base
#   after_action :request_response_logger

  def request_response_logger
    RequestResponseLog.create(
      remote_ip: request.remote_ip,
      request_method: request.method,
      request_url: request.url,
      response_status: response.status,
      response_content_type: response.content_type
    )
  end
end
