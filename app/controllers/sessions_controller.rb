class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "User could not be found"
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end


end
