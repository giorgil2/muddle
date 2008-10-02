require File.dirname(__FILE__) + '/../spec_helper'

describe Application do

  describe "logged_in?" do

    it "should return true with a current_user" do
      @controller = dispatch_to(Application, :logged_in?) do |controller|
        controller.current_user = User.new
      end
      @controller.logged_in?.should be_true
    end

    it "should return false without a current_user" do
      @controller = dispatch_to(Application, :logged_in?)
      @controller.logged_in?.should be_false
    end

  end

  describe "login_required" do

    it "should return true with a current_user" do
      @controller = dispatch_to(Application, :login_required) do |controller|
        controller.current_user = User.new
      end
      @controller.login_required.should be_true
    end

    it "should throw halt without a current_user" do
      lambda { @controller = dispatch_to(Application, :login_required) }.should throw_symbol(:halt)
    end

  end

  describe "login_from_session" do

    it "should set current_user from session with valid user" do
      @user = create_user
      @controller = dispatch_to(Application, :login_from_session) do |controller|
        controller.session[:user_id] = @user.id
      end
      @controller.current_user.should == @user
      @user.destroy
    end

    it "should set current_user to nil without session" do
      @controller = dispatch_to(Application, :login_from_session)
      @controller.current_user.should be_nil
    end

  end

  describe "access_denied" do

    it "should redirect to login with message"

  end

end
