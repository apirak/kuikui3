require 'spec_helper'

describe Comment do
  it "fails validation with no foreign key" do
    @c = Comment.new :comment => "Hello"
    @c.should have(1).errors_on(:message_id)
    @c.errors[:message_id].should == ["foreign key can't be blank"]
  end

  it "fails validation with foreign key must exist" do
    @c = Comment.new :comment => "Hello"
    @c.message_id = 1
    @c.should have(1).errors_on(:message_id)
    @c.errors[:message_id].should == ["foreign key must exist"]
  end

  it "fails validation with no comment" do
    @c = Comment.new :comment => ""
    @c.should have(1).errors_on(:comment)
    @c.errors[:comment].should == ["can't be blank"]
  end

  it "fails validation with no message" do
    @m = Message.create!(:content => "Hello")
    @c = @m.comments.create!(:comment => "Hola")
    @c.should have(:no).errors
  end
end
