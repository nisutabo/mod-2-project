class ReviewsController < ApplicationController
  before_action :require_login
  before_action :retrieve, only: [:show, :edit, :update, :destroy]

  def index
    if params[:property_manager_id]
      @reviews = PropertyManager.find(params[:property_manager_id]).reviews
      @propertymanager = PropertyManager.find(params[:property_manager_id])
    end

  end

  def new
    @review = Review.new
    @lease = @review.build_lease
    @building = @lease.build_building
    @property_manager = @building.build_property_manager
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @review = Review.new(review_params)
    if !@review.lease_id
      @review.lease_id = Lease.last.id
    end
    if @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
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

  def destroy
    @user = User.find(session[:user_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to user_path(@user)
  end



  private

  def review_params
    
    if !params[:review][:lease_id]
      params.require(:review).permit(:response_time, :niceness, :value, :accessibility, :content, lease_attributes: [:rent, :current, :user_id, building_attributes: [:address, :borough, property_manager_attributes: [:name]]])
    else
      params.require(:review).permit(:lease_id, :response_time, :niceness, :value, :accessibility, :content)
    end
  end



  def require_login
    redirect_to login_path unless session.include? :user_id
  end

  def retrieve
    @review = Review.find(params[:id])
  end
end
