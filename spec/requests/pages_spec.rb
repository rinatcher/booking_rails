# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /' do
    it 'is successful response' do
      get root_path
      expect(response).to be_successful
    end
  end
end
