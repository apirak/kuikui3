require 'spec_helper'

describe "messages/show" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :content => "MyText",
      :tags => "Tags",
      :created_at => Date.new(2007, 5, 12)
    ))
    @comments = assign(:comments, [
      stub_model(Comment,
        :comment => "MyComment",
        :message_id => @message.id,
        :created_at => Date.new(2007, 5, 12)
      ),
      stub_model(Comment,
        :comment => "MyComment",
        :message_id => @message.id,
        :created_at => Date.new(2007, 5, 12)
      )
    ])
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/Tags/)
    assert_select "div.message-comment", :text => "MyComment".to_s, :count => 2
  end
end
