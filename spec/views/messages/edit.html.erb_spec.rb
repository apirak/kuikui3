require 'spec_helper'

describe "messages/edit" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :content => "MyText",
      :tags => "MyString",
      :created_at => Date.new(2007, 5, 12)
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "textarea#message_content", :name => "message[content]"
      assert_select "input#message_tags", :name => "message[tags]"
    end
  end
end
