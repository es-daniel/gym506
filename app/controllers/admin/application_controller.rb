module Admin
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  end
end
