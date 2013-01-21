require 'spec_helper'

describe "messages/new" do
  before(:each) do
    assign(:message, stub_model(Message,
      :content => "MyText",
      :tags => "MyString",
      :created_at => Date.new(2007, 5, 12)
    ).as_new_record)
  end

  it "renders new message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path, :method => "post" do
      assert_select "textarea#message_content", :name => "message[content]"
      assert_select "input#message_tags", :name => "message[tags]"
    end
  end
end
