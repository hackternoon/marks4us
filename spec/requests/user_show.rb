require 'spec_helper'

describe "user show" do
  describe "GET /users/show/x", :js => true do
    it "Show me Bookmarks for a user" do
      # Create some bookmarks with 'rails' tags:
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      visit "/users/confirmation?confirmation_token=#{@dan.confirmation_token}"
      m1 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag1 => 'rails',:note => 'This is m1')
      m2 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag1 => 'rails',:note => 'This is m2')
      visit root_path
      click_link "dan@bot4.us"
      page.should have_content "This is m1"
debugger
      page.should have_content "This is m1"

    end # it
  end # describe
end # describe
