class ReviewsController < ApplicationController
  before_action :require_login
  before_action :retrieve, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @user = User.find(session[:user_id])

  end

  def create
    @user = User.find(session[:user_id])
    @review = Review.new(review_params)
    if @review.save
      #byebug
      redirect_to @review
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
      redirect_to @review
    else
      render :edit
    end
  end



  private

  def review_params
    params.require(:review).permit(:lease_id, :rating, :content)
  end

  def require_login
    redirect_to login_path unless session.include? :user_id
  end

  def retrieve
    @review = Review.find(params[:id])
  end
end
