require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Chat do

  describe "#attachment_name" do

    it "should return 'chat'" do
      @post = Chat.new
      @post.attachment_name.should == 'chat'
    end

  end

end