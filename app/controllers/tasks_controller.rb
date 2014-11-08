class TasksController < ApplicationController
  # FIX
  # respond_to :json

  def index
    render json: Task.all, status: 200
  end

  def show
    render json: Task.where(id: params[:id])
  end

  def create
    task = Task.new(task_params)

    if task.save
      render text: 'saved', status: 201
    else
      render text: 'error', status: 422
    end
  end

  def update
     task = Task.where(id: params[:id]).first
     name = params['task']['name']
     task.name = name
    if task.save
      render text: 'saved', status: 201
    else
      render text: 'error', status: 422
    end
  end

  def destroy
    task = Task.where(id: params[:id]).first
    if task.delete
      render text: 'saved', status: 201
    else
      render text: 'error', status: 422
    end
  end

private
  def task_params
    params.require(:task).permit(:name, :completed, :deleted, :user_id, :goal_id, :snooze)
  end
end
