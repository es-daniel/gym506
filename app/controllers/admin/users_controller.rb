module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: %i[edit destroy update]
    def index
      @users = User.where(role: :partner).where.not(id: current_user.id)
    end

    def new
      @user = User.new
    end

    def edit; end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = t('user.created')
        redirect_to admin_users_path
      else
        flash[:error] = t('user.not_created')
        render 'new'
      end
    end

    def update
      if @user.update(user_params)
        flash[:success] = t('user.updated')
        redirect_to admin_users_path
      else
        flash[:error] = t('user.not_updated')
        render 'edit'
      end
    end

    def destroy
      if @user.destroy
        flash[:success] = t('user.destroyed')
      else
        flash[:error] = t('user.not_destroyed')
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :last_name, :email, :phone_number, :position, :role, :address, :photo)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end

