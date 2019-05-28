class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = @list.tasks.all
  end

  def show
  end

  def new
    @task = @list.tasks.new
    render partial: "form"
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to list_task_path(@list.id, @task.id)
    else
      render partial: "form"
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @task.update(task_params)
      redirect_to list_task_path(@list, @task)
    else
      render partial: "form"
    end
  end

  def destroy
    @task.destroy
    redirect_to list_tasks_path(@list)
  end

  private

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:task_name, :description)
    end

end
