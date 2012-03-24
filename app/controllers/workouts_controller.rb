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
    @workout.start

    if @workout.save
      flash[:notice] = "Workout started"
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end

end