require 'spec_helper'

describe "mrks/index" do
  before(:each) do
    assign(:mrks, [
      stub_model(Mrk,
        :uurl => "Uurl",
        :usr_id => 1,
        :user_id => 1,
        :tag1 => "Tag1",
        :tag2 => "Tag2",
        :tag3 => "Tag3",
        :note => "MyText"
      ),
      stub_model(Mrk,
        :uurl => "Uurl",
        :usr_id => 1,
        :user_id => 1,
        :tag1 => "Tag1",
        :tag2 => "Tag2",
        :tag3 => "Tag3",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of mrks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uurl".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag3".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
