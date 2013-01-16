require 'spec_helper'

describe Message do
  it "valid with complete content and tag" do
  	@m = Message.new :content => "hello", :tags => "test, first"
  	@m.should have(:no).errors
    # Message.new(:content => "liquid nitrogen").should have(0).errors_on(:content)
  end

  it "fails validation with no content" do
    @m = Message.new :tags => "test, first"
    @m.should have(1).errors_on(:content)
    @m.errors.on(:content).should == "is required"
  end 
end
