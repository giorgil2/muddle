require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Quote do

  describe "#attachment_name" do

    it "should return 'quote'" do
      @post = Quote.new
      @post.attachment_name.should == 'quote'
    end

  end

  describe "#css_class" do

    it "should return 'post'" do
      @post = Quote.new
      @post.css_class.should == 'post'
    end

  end

end