class GoalsController < ApplicationController
  # FIX
  # respond_as :json

  def index
    # FIX
    # respond_with
    render json: Goal.all, status: 200
  end

  def show
    render json: Goal.where(id: params[:id])
  end

  def create
    goal = Goal.new(goal_params)

    if goal.save
      render text: 'saved', status: 201
    else
      render text: 'error', status: 422
    end
  end

private
  def goal_params
    params.require(:goal).permit(:name, :circle, :category)
  end
end
