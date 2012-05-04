require 'spec_helper'

describe "usrs/index" do
  before(:each) do
    assign(:usrs, [
      stub_model(Usr,
        :name => "Name",
        :password_digest => "Password Digest"
      ),
      stub_model(Usr,
        :name => "Name",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of usrs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
