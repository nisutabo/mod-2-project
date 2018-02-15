class LeasesController < ApplicationController


  def new
    @user = User.find(session[:user_id])
    @lease = Lease.new
  end

  def create
    @lease = Lease.new(lease_params)
    if @lease.save
      redirect_to @lease
    else
      render :new
    end
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

  private

  def lease_params
    params.require(:lease).permit(:user_id, :building_id, :rent, :current)
  end

end
