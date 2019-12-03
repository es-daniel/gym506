module Admin
  class ProfilesController < Admin::ApplicationController
    before_action :set_profile, only: %i[edit destroy update]
    def index
      @profiles = User.where(role: [:admin, :instructor]).where.not(id: current_user.id)
    end

    def new
      @profile = User.new
    end

    def edit; end

    def create
      @profile = User.new(profile_params)
      if @profile.save
        flash[:success] = t('profile.created')
        redirect_to admin_profiles_path
      else
        flash[:error] = t('profile.not_created')
        render 'new'
      end
    end

    def update
      if @profile.update(profile_params)
        flash[:success] = t('profile.updated')
        redirect_to admin_profiles_path
      else
        flash[:error] = t('profile.not_updated')
        render 'edit'
      end
    end

    def destroy
      if @profile.destroy
        flash[:success] = t('profile.destroyed')
      else
        flash[:error] = t('profile.not_destroyed')
      end
      redirect_to admin_profiles_path
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

