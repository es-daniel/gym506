module Admin
  class ActivitiesController < Admin::ApplicationController
    before_action :set_activity, only: %i[edit destroy update]
    
    def index
      @activities = Activity.all
    end

    def new
      @activity = Activity.new
    end

    def edit; end

    def create
      @activity = Activity.new(activity_params)
      if @activity.save
        flash[:success] = t('activity.created')
        redirect_to admin_activities_path
      else
        flash[:error] = t('activity.not_created')
        render 'new'
      end
    end

    def update
      if @activity.update(activity_params)
        flash[:success] = t('activity.updated')
        redirect_to admin_activities_path
      else
        flash[:error] = t('activity.not_updated')
        render 'edit'
      end
    end

    def destroy
      if @activity.destroy
        flash[:success] = t('activity.destroyed')
      else
        flash[:error] = t('activity.not_destroyed')
      end
      redirect_to admin_activities_path
    end

    private

    def activity_params
      params.require(:activity).permit(:name, :start_date, :maximum_capacity, :user_id)
    end

    def set_activity
      @activity = Activity.find(params[:id])
    end

  end
end

