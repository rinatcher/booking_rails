# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Bookings', type: :request do
  let(:valid_attributes) do
    {
      name: 'Anything',
      email: 'test@test.com',
      start_date: DateTime.now,
      end_date: DateTime.now + 1.week,
      room_id: 1
    }
  end
  let(:admin) do
    User.create!(email: 'test@test.com', password: 'test_pass', role: :admin)
  end

  before do
    sign_in admin
    Room.create!(id: 1, name: 'room_test', description: 'test test test', price: 100)
  end

  describe 'GET /index' do
    it 'is successful response' do
      Booking.create! valid_attributes
      sign_in :admin
      get admin_bookings_path
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'removes right booking' do
      booking = Booking.create! valid_attributes
      expect do
        delete admin_booking_path(booking)
      end
    end
  end
end
