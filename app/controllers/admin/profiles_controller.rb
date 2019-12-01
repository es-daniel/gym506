module Admin
  class ProfilesController < Admin::ApplicationController
    before_action :set_profile, only: %i[edit destroy update]
    def index
      @profiles = User.where(role: [:admin, :instructor])
    end

    def new
      @profile = User.new
    end

    def edit; end

    def create
      @profile = User.new(profile_params)
      if @profile.save
        flash[:success] = 'Perfil Creado'
      else
        render 'new'
      end
    end

    def update
      if @profile.update(profile_params)
        flash[:success] = 'Perfil Creado'
      else
        render 'new'
      end
    end

    def destroy
      @profile.destroy
    end

    private

    def profile_params
      params.require(:user).permit(:name, :last_name, :email, :phone_number, :position, :role, :address, :photo)
    end

    def set_profile
      @profile = User.find(params[:id])
    end
  end
end

