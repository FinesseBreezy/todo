class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_info)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def create
    @task = Task.new(task_info)

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end


  private
  def task_info
    params.require(:task).permit(:title,:body,:rank)
  end

end
