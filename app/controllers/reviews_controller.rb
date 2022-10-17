class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update show destroy]

  def index
    @articles = Review.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = 'Article was successfully created'
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:success] = 'Review was updated'
      redirect_to review_path(@review)
    else
      flash[:success] = 'Review was not updated'
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Review was deleted'
    redirect_to review_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description)
  end
end

