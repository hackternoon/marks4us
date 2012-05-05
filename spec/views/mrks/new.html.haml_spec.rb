require 'spec_helper'

describe "mrks/new" do
  before(:each) do
    assign(:mrk, stub_model(Mrk,
      :uurl => "MyString",
      :usr_id => 1,
      :user_id => 1,
      :tag1 => "MyString",
      :tag2 => "MyString",
      :tag3 => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new mrk form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => mrks_path, :method => "post" do
      assert_select "input#mrk_uurl", :name => "mrk[uurl]"
      assert_select "input#mrk_usr_id", :name => "mrk[usr_id]"
      assert_select "input#mrk_user_id", :name => "mrk[user_id]"
      assert_select "input#mrk_tag1", :name => "mrk[tag1]"
      assert_select "input#mrk_tag2", :name => "mrk[tag2]"
      assert_select "input#mrk_tag3", :name => "mrk[tag3]"
      assert_select "textarea#mrk_note", :name => "mrk[note]"
    end
  end
end
