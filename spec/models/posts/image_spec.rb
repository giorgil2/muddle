require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Image do

  describe "#attachment_name" do

    it "should return 'image'" do
      @post = Image.new
      @post.attachment_name.should == 'image'
    end

  end

  describe "#css_class" do

    it "should return 'post'" do
      @post = Image.new
      @post.css_class.should == 'post'
    end

  end

end