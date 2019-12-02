class Home::HomeController < ApplicationController
  before_action :set_services
  def index; end

  private
  def set_services
    @services = GymService.all
  end
end
