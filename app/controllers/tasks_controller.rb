class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]
    @task.save
    respond_to do |format|
      format.html { redirect_to project_path }
      format.js
    end
  end

  def task_params
    params.require(:task).permit(:name, :done, :deadline)
end
