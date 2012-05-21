require 'spec_helper'

describe "show guest bookmarks" do
  describe "GET /usrs/get_guest", :js => true do
    it "Show me Bookmarks for guests" do
      # Create some bookmarks with 'rails' tags:
      visit root_path
      click_link 'Create New Bookmark!'
      page.should have_content "Create New Bookmark!"
      fill_in('mrk_uurl', :with => 'http://mrks4.us')
      fill_in('mrk_tag1', :with => 'Bookmark Site')
      fill_in('mrk_tag2', :with => 'Very Simple')
      fill_in('mrk_tag3', :with => 'Rails Demo')
      fill_in('mrk_note', :with => 'This MVP bookmark site sprung from a "project" listed on hackternoon.com and built during meetup.com/Hackternoon')
      click_button 'Save'
      page.should have_content "This MVP bookmark site"
      click_link "Guest Account"
      page.should have_content "This MVP bookmark site"

    end # it
  end # describe
end # describe
