require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Video do

  describe "#attachment_name" do

    it "should return 'video'" do
      @post = Video.new
      @post.attachment_name.should == 'video'
    end

  end

  describe "#css_class" do

    it "should return 'post'" do
      @post = Video.new
      @post.css_class.should == 'post'
    end

  end

end