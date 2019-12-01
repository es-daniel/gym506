module Admin
  class UserExercisesController < Admin::ApplicationController
    before_action :set_user
    before_action :set_user_exercise, only: %i[edit destroy update]
    
    def index
      @user_exercises = UserExercise.where(user: @user).all.group_by(&:preferred_day_id)
    end

    def new
      @user_exercise = UserExercise.new(user: @user)
    end

    def edit; end

    def create
      @user_exercise = UserExercise.new(user_exercise_params)
      if @user_exercise.save
        flash[:success] = t('user_exercise.created')
        redirect_to admin_user_user_exercises_path(@user)
      else
        flash[:error] = t('user_exercise.not_created')
        render 'new'
      end
    end

    def update
      if @user_exercise.update(user_exercise_params)
        flash[:success] = t('user_exercise.updated')
        redirect_to admin_user_user_exercises_path(@user)
      else
        flash[:error] = t('user_exercise.not_updated')
        render 'edit'
      end
    end

    def destroy
      if @user_exercise.destroy
        flash[:success] = t('user_exercise.destroyed')
      else
        flash[:error] = t('user_exercise.not_destroyed')
      end
    end

    private

    def user_exercise_params
      params.require(:user_exercise).permit(:user_id, :preferred_day_id, :name, :repetitions, :series, :user_rest)
    end

    def set_user_exercise
      @user_exercise = UserExercise.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end

