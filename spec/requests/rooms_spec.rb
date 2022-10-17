# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  let(:valid_attributes) do
    {
      name: 'test',
      description: 'test test test',
      price: 100
    }
  end

  describe 'GET /index' do
    it 'is successful response with valid attributes' do
      Room.create! valid_attributes
      get rooms_path
      expect(response).to be_successful
    end
  end
end
