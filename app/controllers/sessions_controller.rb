class SessionsController < ApplicationController

  def new
    redirect_to(projects_path) if signed_in?
  end

  def create
    manager  = Manager.find_by(email: params[:session][:email].downcase)
    if manager && manager.authenticate(params[:session][:password])
      sign_in manager
      redirect_to projects_path
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
