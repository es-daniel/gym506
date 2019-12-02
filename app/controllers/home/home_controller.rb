class Home::HomeController < ApplicationController
  before_action :set_services, :set_instructors
  def index; end

  private

  def set_services
    @services = GymService.all
  end

  def set_instructors
    @instructors = User.where(role: :instructor)
  end
end
