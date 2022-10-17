class RequestResponseLog < ApplicationRecord
  validates :remote_ip, :request_method, :request_url, presence: true
  validates :response_status, :response_content_type, presence: true
end
