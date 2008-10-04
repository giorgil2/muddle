require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Video do

  describe "#attachment_name" do

    it "should return 'video'" do
      @post = Video.new
      @post.attachment_name.should == 'video'
    end

  end

end