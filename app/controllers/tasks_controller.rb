class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all #changes @task to plural Tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params) #changes Task.new to Task.create
    if @task.save
      redirect_to task_path(@task), notice: 'Task was successfully created.' # added (@task) to task_path
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.' #changed (redirected_to (@task) to (tasks_path(@task))
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task  #removed (s) from the end of set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:priority, :description) #added (:description) to permit list
    end
end
