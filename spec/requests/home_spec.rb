require 'spec_helper'

describe "Home Page" do
  describe "GET /", :js => true do
    it "Show me the home page" do
      get root_path
      response.status.should be(200)
      visit root_path
      page.should have_content "Welcome"
      page.should have_link "marks4.us"
      click_link "marks4.us"
      page.should have_link "marks4.us"
      page.should have_link "Sign In"
      click_link "Sign In"
      page.should have_content "Sign In"
      page.should have_content "E-Mail or Name"
      page.should have_content "Password"
      click_link "marks4.us"
      click_link "Sign Up"
      page.should have_content "Permanent Account Sign up"
      page.should have_content "OR ... Temporary (2 Month) Account Sign up"
      click_link "marks4.us"
      click_link "Sign Out"
      page.should have_content "You are ..."
      page.should have_content "Signed Out."
      click_link "marks4.us"
      click_link "Bookmarks!"
      page.should have_content "Bookmarks!"
      page.should have_content "The URL"
      page.should have_link "Create New Bookmark!"
      click_link "marks4.us"
      click_link "Permanent"
      page.should have_content "Permanent Accounts"
      page.should have_content "E-Mail"
      page.should have_content "Number of Bookmarks"
      click_link "marks4.us"
      click_link "2 Month"
      page.should have_content "2 Month Accounts"
      page.should have_content "Name"
      page.should have_content "Number of Bookmarks"
      click_link "marks4.us"
      click_link "Guest"
      page.should have_content "Account: Guest"
      page.should have_content "This is a Guest Account."
      page.should have_link "Guest Account."
    end
  end
end
