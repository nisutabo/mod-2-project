class PropertyManagersController < ApplicationController
  before_action :retrieve, only: [:show]

  def index
    @property_managers = PropertyManager.all
  end

  def show
  end

  private

  def retrieve
    @property_manager = PropertyManager.find(params[:id])
  end
end
