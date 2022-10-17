# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show]

  def index
    @reviews = Review.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = 'Отзыв отправлен! Ожидайте подтверждения администратора'
      redirect_to reviews_path
    else
      flash[:alert] = 'Неверно введены данные'
      render :new
    end
  end

  def show; end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:name, :email, :description)
  end
end
