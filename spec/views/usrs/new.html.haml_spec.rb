require 'spec_helper'

describe "usrs/new" do
  before(:each) do
    assign(:usr, stub_model(Usr,
      :name => "MyString",
      :password_digest => "MyString"
    ).as_new_record)
  end

  it "renders new usr form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usrs_path, :method => "post" do
      assert_select "input#usr_name", :name => "usr[name]"
      assert_select "input#usr_password_digest", :name => "usr[password_digest]"
    end
  end
end
