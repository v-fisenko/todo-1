class ProjectsController < ApplicationController

  before_action :signed_in_manager

  def index
    @projects = current_manager.projects.order('priority')
    @project = Project.new
  end

  def create
    @project = current_manager.projects.new(project_params)
    @project.priority ||= 1
    @project.save()
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def update
    @project = Project.find_by_id(params[:id])
    respond_to do |format|
      if @project.update_attributes(project_params)
        format.html { redirect_to projects_path }
        format.json { respond_with_bip(@project) }
      else
        format.html { redirect_to projects_path }
        format.json { respond_with_bip(@project) }
      end
    end
  end

  def destroy
    @project = Project.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end

  end

  private

    def signed_in_manager
      unless signed_in?
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def project_params
      params.require(:project).permit(:name)
    end 

end
