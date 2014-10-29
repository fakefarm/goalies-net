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

private
  def goal_params
    params.require(:goal).permit(:name, :circle, :category)
  end
end
