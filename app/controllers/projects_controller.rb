class ProjectsController < ApplicationController

  before_action :signed_in_manager, only: [:index]

  def index
    @projects = current_manager.projects.order('priority')
  end

  def new
    @project = Project.new
  end

  private

    def signed_in_manager
      unless signed_in?
        redirect_to signin_path, notice: "Please sign in."
      end
    end

end
