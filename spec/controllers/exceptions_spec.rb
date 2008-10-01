require File.dirname(__FILE__) + '/../spec_helper'

describe Exceptions do

  describe "#not_found" do

    it "render not found" do
      @controller = dispatch_to(Exceptions, :not_found)
    end

  end

  describe "#not_acceptable" do

    it "render not acceptable" do
      @controller = dispatch_to(Exceptions, :not_acceptable)
    end

  end

end