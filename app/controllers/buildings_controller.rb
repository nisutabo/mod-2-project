class BuildingsController < ApplicationController

  def index
    @buildings = Building.all.select {|building| building.address.downcase.include?(params[:q].downcase)}
  end
end
