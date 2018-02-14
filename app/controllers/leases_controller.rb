class LeasesController < ApplicationController

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
