require 'spec_helper'

describe "usr show" do
  describe "GET /usrs/x", :js => true do
    it "Show me Bookmarks for a usr" do
      # Create some bookmarks with 'rails' tags:
      @dan = FactoryGirl.create(:usr)
      m1 = FactoryGirl.create(:mrk, :usr_id => @dan.id, :user_id => nil,:tag1 => 'rails',:note => 'This is m1')
      m2 = FactoryGirl.create(:mrk, :usr_id => @dan.id, :user_id => nil,:tag1 => 'rails',:note => 'This is m2')
      visit root_path
      click_link "Sign In"
      fill_in('user_email', :with => 'dan')
      fill_in('user_password', :with => 'abc123')
      click_button 'Sign in'
      page.should have_content "You are now signed in"
      click_link "dan"
      page.should have_content "This is m1"

    end # it
  end # describe
end # describe
