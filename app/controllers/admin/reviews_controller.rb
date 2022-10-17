# frozen_string_literal: true

module Admin
  class ReviewsController < ApplicationController
    before_action :set_review, only: %i[update show destroy]
    before_action :authenticate_user!

    def index
      @reviews = Review.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    end

    def show; end

    def update
      @review.update(approved: 1)
      redirect_to admin_reviews_path
      flash[:success] = 'Отзыв подтвержден'
    end

    def destroy
      @review.destroy
      flash[:success] = 'Отзыв удален'
      redirect_to admin_reviews_path
    end

    private

    def set_review
      @review = Review.find(params[:id])
    end
  end
end
