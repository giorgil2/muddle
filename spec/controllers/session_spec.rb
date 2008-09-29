require File.dirname(__FILE__) + '/../spec_helper'

describe Session do

  before(:all) do
    User.auto_migrate!
  end

  describe "new action" do

    it "should render new action" do
      @controller = dispatch_to(Session, :new)
    end

  end

  describe "create action success" do

    before(:each) do
      @user = create_user
    end

    after(:each) do
      @user.destroy
    end

    it "should set current_user and session[:user_id]" do
      @controller = dispatch_to(Session, :create, { :email => 'email@email.email', :password => 'password' })
      @controller.current_user.should == @user
      @controller.session[:user_id].should == @user.id
    end

    it "should temporary redirect to url(:home) with message" do
      @controller = dispatch_to(Session, :create, { :email => 'email@email.email', :password => 'password' })
      @controller.session[:return_to].should be_nil
      @controller.status.should == 302
      @controller.headers['Location'].should == @controller.url(:home) + encode_message("You logged in as email@email.email")
    end

  end


  describe "create action failure" do

    before(:each) do
      @controller = dispatch_to(Session, :create, { :email => 'email@email.email', :password => 'password' })
    end

    it "should set current_user and session[:user_id] to nil" do
      @controller.current_user.should be_nil
      @controller.session[:user].should be_nil
    end

    it "should temporary redirect to login with message" do
      @controller.status.should == 302
      @controller.headers['Location'].should == @controller.url(:login) + encode_message("Incorrect email or password")
    end

  end


  describe "destroy action" do
    before(:each) do
      @user = create_user
    end

    after(:each) do
      @user.destroy
    end

    it "should set current_user and session[:user_id] to nil" do
      @controller = dispatch_to(Session, :destroy) do |controller|
        controller.current_user = @user
        controller.session[:user_id] = @user.id
      end
      @controller.current_user.should be_nil
      @controller.session[:user_id].should be_nil
    end

    it "should temporary redirect to url(:login)" do
      @controller = dispatch_to(Session, :destroy) do |controller|
        controller.session[:return_to] = controller.url(:login)
      end
      @controller.status.should == 302
      @controller.headers['Location'].should == @controller.url(:login) + encode_message("You logged out")
    end

  end

end
