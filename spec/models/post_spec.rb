require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Post do

  describe "#attachment_name" do

    it "should return 'post'" do
      @post = Post.new
      @post.attachment_name.should == 'post'
    end

  end

  describe "#css_class" do

    it "should return 'post'" do
      @post = Post.new
      @post.css_class.should == 'post'
    end

  end

end