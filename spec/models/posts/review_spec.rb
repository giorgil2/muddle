require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Review do

  describe "#attachment_name" do

    it "should return 'review'" do
      @post = Review.new
      @post.attachment_name.should == 'review'
    end

  end

  describe "#css_class" do

    it "should return 'hreview post'" do
      @post = Review.new
      @post.css_class.should == 'hreview post'
    end

  end

end