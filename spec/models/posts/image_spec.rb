require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Image do

  describe "#attachment_name" do

    it "should return 'image'" do
      @post = Image.new
      @post.attachment_name.should == 'image'
    end

  end

end