class SessionsController < ApplicationController

  def new
  end

  def create
    manager  = Manager.find_by(email: params[:session][:email].downcase)
    if manager && manager.authenticate(params[:session][:password])
      sign_in manager
      redirect_to projects_path
    else
#      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end

end
