class LeasesController < ApplicationController


  def new
    @review = Review.new
    @user = User.find(session[:user_id])
  end

  def create
  end

  def show
    @user = User.find(session[:user_id])
    @lease = Lease.find(params[:id])
  end

  def destroy
    @user = User.find(session[:user_id])
    @lease = Lease.find(params[:id])
    @lease.destroy
    redirect_to @user
  end

end
