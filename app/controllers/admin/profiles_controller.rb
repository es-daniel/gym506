module Admin
  class ProfilesController < Admin::ApplicationController
    def index
      @profiles = User.where(role: [:admin, :instructor])
    end

    def new
      @profile = User.new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end

