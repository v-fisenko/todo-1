module SessionsHelper

  def signed_in?
    !current_manager.nil?
  end

  def current_manager
    remember_token = Manager.encrypt(cookies[:remember_token])
    @current_manager ||= Manager.find_by(remember_token: remember_token)
  end

  def current_manager=(manager)
    @current_manager = manager
  end

  def sign_in(manager)
    remember_token = Manager.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    manager.update_attribute(:remember_token, Manager.encrypt(remember_token))
    self.current_manager = manager
  end

  def sign_out
    current_manager.update_attribute(:remember_token, Manager.encrypt(Manager.new_remember_token))
    cookies.delete(:remember_token)
    self.current_manager = nil
  end

end
