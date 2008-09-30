require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Post do

  describe "#attachment_name" do

    it "should return the downcased name of the post_type" do
      @post = Audio.new
      @post.attachment_name.should == @post.post_type.name.downcase
    end

  end

  describe "#css_class" do

    it "should return 'xfolkentry post' for Link" do
      @post = Link.new
      @post.css_class.should == 'xfolkentry post'
    end

    it "should return 'hreview post' for Review" do
      @post = Review.new
      @post.css_class.should == 'hreview post'
    end

    it "should simply return 'post' as default" do
      @post = Post.new
      @post.css_class.should == 'post'
    end

  end

end