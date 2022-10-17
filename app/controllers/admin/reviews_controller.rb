# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update show destroy]

  def index
    @reviews = Review.paginate(page: params[:page], per_page: 1).order(updated_at: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = 'Review was successfully created!'
      redirect_to reviews_path(@review)
    else
      flash[:error] = 'Неверно введены данные'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @review.update(review_params)
      flash[:success] = 'Review was updated'
      redirect_to reviews_path(@review)
    else
      flash[:success] = 'Review was not updated'
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'Review was deleted'
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:name, :email, :description)
  end
end
