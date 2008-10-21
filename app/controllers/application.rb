class Application < Merb::Controller

  def logged_in?
    !!session.user
  end

  # def login_required
  #   logged_in? || throw(:halt, :access_denied)
  # end

  def current_user
    @current_user = session.user
    # @current_user ||= (login_from_session || nil)
  end

  # def current_user=(user)
  #   session[:user_id] = user.nil? ? nil : user.id
  #   @current_user = user
  # end
  # 
  # def login_from_session
  #   self.current_user = User.first(:id => session[:user_id]) if session[:user_id]
  # end
  # 
  # def access_denied
  #   redirect(url(:login), :message => "You must login to access this page")
  # end

end