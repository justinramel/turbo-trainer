class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @workouts = current_user.workouts
  end

end