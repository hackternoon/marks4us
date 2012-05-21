require 'spec_helper'

describe "Mrks show edit" do
  describe "show edit", :js => true do
    it "shows an edit link in show view" do
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      visit "/users/confirmation?confirmation_token=#{@dan.confirmation_token}"
      click_link 'Create New Bookmark!'
      page.should have_content "Create New Bookmark!"
      fill_in('mrk_uurl', :with => 'http://mrks4.us')
      fill_in('mrk_tag1', :with => 'Bookmark Site')
      fill_in('mrk_tag2', :with => 'Very Simple')
      fill_in('mrk_tag3', :with => 'Rails Demo')
      fill_in('mrk_note', :with => 'This MVP bookmark site sprung from a "project" listed on hackternoon.com and built during meetup.com/Hackternoon')
      click_button 'Save'
      page.should have_content 'Mrk was successfully created'
      page.should have_content 'A Bookmark'
      click_link 'Edit This Bookmark'
      page.should have_content 'Edit This Bookmark'
      page.should have_link 'DELETE This Bookmark'

    end
  end
end
