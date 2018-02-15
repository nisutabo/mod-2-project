class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def about

  end

  def home
    render :layout => "home"
  end

end
