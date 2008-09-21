require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Session, "index action" do
  before(:each) do
    dispatch_to(Session, :index)
  end
end