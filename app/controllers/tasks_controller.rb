class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = params[:id]
    @task = Task.find(@tasks)
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(require_task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(require_task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def require_task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
