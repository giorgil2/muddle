require File.join( File.dirname(__FILE__), '..', '..', "spec_helper" )

describe Review do

  describe "#attachment_name" do

    it "should return 'review'" do
      @post = Review.new
      @post.attachment_name.should == 'review'
    end

  end

end