# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin::Reviews', type: :request do
  let(:valid_attributes) do
    {
      name: 'test',
      email: 'test@test.com',
      description: 'test test test'
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
      Review.create! valid_attributes
      sign_in :admin
      get admin_reviews_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'is successful showing review response' do
      review = Review.create! valid_attributes
      get admin_review_path(review)
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'removes right review' do
      review = Review.create! valid_attributes
      expect do
        delete admin_review_path(review)
      end
    end
  end
end
