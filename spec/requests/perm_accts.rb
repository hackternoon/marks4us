require 'spec_helper'

describe "Permanent Accounts Page" do
  describe "GET /users/index", :js => true do
    it "Show me the Permanent Accounts Page" do
      "/users/index".should == get_users_index_path
      get get_users_index_path
      response.status.should be(200)
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      visit get_users_index_path
      page.should have_content "E-Mail"
      page.should have_content "Number of Bookmarks"
      page.should have_content 'dan@bot4.us'
      (10..99).each{|n| FactoryGirl.create(:user,:email=>"dan#{n}@bot4.us")}
      visit get_users_index_path
      page.should have_content 'dan10@bot4.us'
      click_link "Last"
      page.should have_content 'dan99@bot4.us'
      click_link "First"
      page.should have_content 'dan10@bot4.us'
      click_link "Next"
      page.should have_content 'dan36@bot4.us'
      click_link "Prev"
      page.should have_content 'dan10@bot4.us'
    end

  end
end
