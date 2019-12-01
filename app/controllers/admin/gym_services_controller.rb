module Admin
  class GymServicesController < Admin::ApplicationController
    before_action :set_service, only: %i[edit destroy update]
    
    def index
      @services = GymService.all
    end

    def new
      @service = GymService.new
    end

    def edit; end

    def create
      @service = GymService.new(service_params)
      if @service.save
        flash[:success] = t('user_exercise.created')
        redirect_to admin_gym_services_path
      else
        flash[:error] = t('user_exercise.not_created')
        render 'new'
      end
    end

    def update
      if @service.update(service_params)
        flash[:success] = t('user_exercise.updated')
        redirect_to admin_gym_services_path
      else
        flash[:error] = t('user_exercise.not_updated')
        render 'edit'
      end
    end

    def destroy
      if @service.destroy
        flash[:success] = t('user_exercise.destroyed')
      else
        flash[:error] = t('user_exercise.not_destroyed')
      end
      redirect_to admin_gym_services_path
    end

    private

    def service_params
      params.require(:gym_service).permit(:name, :description, :photo)
    end

    def set_service
      @service = GymService.find(params[:id])
    end

  end
end

