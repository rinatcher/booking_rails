# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookings', type: :request do
  let(:valid_attributes) do
    {
      name: 'Anything',
      email: 'test@test.com',
      start_date: DateTime.now,
      end_date: DateTime.now + 1.week
    }
  end

  describe 'POST /create' do
    it 'creates a new booking' do
      expect do
        post bookings_path, params: { review: valid_attributes }
      end
    end
  end
end
