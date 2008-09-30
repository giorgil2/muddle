require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Link do

  describe "#attachment_name" do

    it "should return 'link'" do
      @post = Link.new
      @post.attachment_name.should == 'link'
    end

  end

  describe "#css_class" do

    it "should return 'xfolkentry post'" do
      @post = Link.new
      @post.css_class.should == 'xfolkentry post'
    end

  end

end