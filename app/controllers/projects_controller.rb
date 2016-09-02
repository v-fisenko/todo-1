class ProjectsController < ApplicationController

  before_action :signed_in_manager

  def index
  end

  private

    def signed_in_manager
      unless signed_in?
        redirect_to signin_path, notice: "Please sign in."
      end
    end

end
