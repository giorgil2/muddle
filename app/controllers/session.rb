class Session < Application

  def create
    self.current_user = User.authenticate(params[:email], params[:password])
    if logged_in?
      redirect(url(:home), :message => "You logged in as #{params[:email]}")
    else
      redirect(url(:login), :message => "Incorrect email or password")
    end
  end

  def destroy
    self.current_user = nil
    redirect(url(:login), :message => "You logged out")
  end

  def new
    render
  end

end
