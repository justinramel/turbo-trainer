class WorkoutsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params[:workout])
    @workout.user = current_user

    if @workout.start!
      current_user.workouts << @workout
      flash[:notice] = "Workout started"
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.stop!
    flash[:notice] = "Workout stopped"
    redirect_to root_path
  end

end