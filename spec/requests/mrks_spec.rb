require 'spec_helper'

describe "Mrks" do
  describe "GET /mrks", :js => true do
    it "works! (now write some real specs)" do
      visit mrks_path
      page.should have_content "Bookmarks!"
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      m1 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil)
      (10..99).each{|n| FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil, :note => "note#{n}")}
      visit mrks_path
      page.should have_content "Bookmarks!"
      page.should have_content "note99"
      # Test Kaminari
      click_link "Last"
      page.should have_content 'note10'
      click_link "First"
      page.should have_content 'note99'
      click_link "Next"
      page.should have_content 'note74'
      click_link "Prev"
      page.should have_content 'note99'
      click_link 'marks4.us'
      click_link 'Create New Bookmark!'
      page.should have_content "Create New Bookmark!"
      fill_in('mrk_uurl', :with => 'http://mrks4.us')
      fill_in('mrk_tag1', :with => 'Bookmark Site')
      fill_in('mrk_tag2', :with => 'Very Simple')
      fill_in('mrk_tag3', :with => 'Rails Demo')
      fill_in('mrk_note', :with => 'This MVP bookmark site sprung from a "project" listed on hackternoon.com and built during meetup.com/Hackternoon')
      click_button 'Save'
      page.should have_content 'mark'
    end
  end
end
