# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  let(:valid_attributes) do
    {
      name: 'test',
      email: 'test@test.com',
      description: 'test test test'
    }
  end

  describe 'GET /index' do
    it 'is successful response with valid attributes' do
      Review.create! valid_attributes
      get reviews_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'is successful showing review response' do
      review = Review.create! valid_attributes
      get review_path(review)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    it 'creates a new review' do
      expect do
        post reviews_path, params: { review: valid_attributes }
      end
    end
  end
end
