class GoalsController < ApplicationController

  def index
    render json: Goal.all, status: 200
  end
end
