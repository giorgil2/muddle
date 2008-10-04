require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Audio do

  describe "#attachment_name" do

    it "should return 'audio'" do
      @post = Audio.new
      @post.attachment_name.should == 'audio'
    end

  end

end