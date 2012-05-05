require 'spec_helper'

describe "mrks/show" do
  before(:each) do
    @mrk = assign(:mrk, stub_model(Mrk,
      :uurl => "Uurl",
      :usr_id => 1,
      :user_id => 1,
      :tag1 => "Tag1",
      :tag2 => "Tag2",
      :tag3 => "Tag3",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uurl/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag3/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
