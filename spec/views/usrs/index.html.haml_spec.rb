require 'spec_helper'

describe "usrs/index" do
  before(:each) do
    assign(:usrs, [
      stub_model(Usr,
        :name => "al",
        :password => "abc123",
        :password_confirmation => "abc123"
      ),
      stub_model(Usr,
        :name => "bob",
        :password => "abc123",
        :password_confirmation => "abc123"
      )
    ])
  end

  it "renders a list of usrs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "al".to_s, :count => 1
  end
end
