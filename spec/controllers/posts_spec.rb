require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Posts, "index" do

  it "should set posts variable" do
    @controller = dispatch_to(Posts, :index)
    @controller.instance_variable_get(:@posts).should == []
  end

end