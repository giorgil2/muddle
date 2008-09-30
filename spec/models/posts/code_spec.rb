require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Code do

  describe "#attachment_name" do

    it "should return 'code'" do
      @post = Code.new
      @post.attachment_name.should == 'code'
    end

  end

  describe "#css_class" do

    it "should return 'post'" do
      @post = Code.new
      @post.css_class.should == 'post'
    end

  end

end