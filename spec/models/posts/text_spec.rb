require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Text do

  describe "#attachment_name" do

    it "should return 'text'" do
      @post = Text.new
      @post.attachment_name.should == 'text'
    end

  end

  describe "#css_class" do

    it "should return 'post'" do
      @post = Text.new
      @post.css_class.should == 'post'
    end

  end

end