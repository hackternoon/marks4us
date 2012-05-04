require 'spec_helper'

describe "usrs/show" do
  before(:each) do
    @usr = assign(:usr, stub_model(Usr,
      :name => "Name",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Password Digest/)
  end
end
