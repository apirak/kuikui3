require 'spec_helper'

describe "messages/index" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :content => "MyText",
        :tags => "Tags",
        :created_at => Date.new(2007, 5, 12)      
      ),
      stub_model(Message,
        :content => "MyText",
        :tags => "Tags",
        :created_at => Date.new(2007, 5, 12)
      )
    ])
  end

  it "renders a list of messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
  end
end
