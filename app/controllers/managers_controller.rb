class ManagersController < ApplicationController
  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      sign_in @manager
#      flash[:success] = "Welcome to the Maager TODO!"
      redirect_to project_path
    else
#      flash[:error] = "Some error"
      render 'new'
    end
  end

  private

    def manager_params
      params.require(:manager).permit(:name, :email, :password, :password_confirmation )
    end


end
