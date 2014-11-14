class GoalsController < ApplicationController
  # FIX
  # respond_to :json

  def index
    # FIX
    render json: Goal.all, status: 200
  end

  def show
    render json: Goal.where(id: params[:id])
  end

  def create
    goal = Goal.new(goal_params)

    if goal.save
      render json: goal
    else
      render text: 'error', status: 422
    end
  end

  def update
     goal = Goal.where(id: params[:id]).first
     name = params['goal']['name']
     goal.name = name
     if goal.save
      render text: 'saved', status: 201
    else
      render text: 'error', status: 422
    end
  end

  def destroy
    goal = Goal.where(id: params[:id]).first
    if goal.delete
      render text: 'saved', status: 201
    else
      render text: 'error', status: 422
    end
  end

private
  def goal_params
    params.require(:goal).permit(:name, :circle, :category, :quarter)
  end
end
