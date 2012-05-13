require 'spec_helper'

describe "Temp 2 Month Accounts Page" do
  describe "GET /usrs", :js => true do
    it "Show me the 2 Month Accounts Page" do
      "/usrs".should == usrs_path
      get usrs_path
      response.status.should be(200)
      @dan = FactoryGirl.create(:usr, :name => 'dan')
      visit usrs_path
      page.should have_content "Name"
      page.should have_content "Number of Bookmarks"
      page.should have_content 'dan'
      (10..99).each{|n| FactoryGirl.create(:usr,:name=>"dan#{n}")}
      visit usrs_path
      page.should have_content 'dan10'
      click_link "Last"
      page.should have_content 'dan99'
      click_link "First"
      page.should have_content 'dan10'
      click_link "Next"
      page.should have_content 'dan36'
      click_link "Prev"
      page.should have_content 'dan10'
    end

  end
end
