# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Rooms', type: :request do
  let(:valid_attributes) do
    {
      name: 'test',
      description: 'test test test',
      price: 100
    }
  end

  let(:admin) do
    User.create!(email: 'test@test.com', password: 'test_pass', role: :admin)
  end

  before do
    sign_in admin
  end

  describe 'GET /index' do
    it 'is successful response' do
      get admin_rooms_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'is successful new response' do
      get new_admin_room_path
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'is successful edit response' do
      room = Room.create! valid_attributes
      get edit_admin_room_path(room)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'creates a new room correctly' do
      expect do
        post admin_rooms_path, params: { room: valid_attributes }
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested room' do
      room = Room.create! valid_attributes
      expect do
        delete admin_room_path(room)
      end
    end
  end
end
