require 'spec_helper'

describe "Destroy @mrk" do
  describe "DELETE @mrk", :js => true do
    it "Show me a tag link for the rails tag" do
      # Create some bookmarks with 'rails' tags:
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      visit "/users/confirmation?confirmation_token=#{@dan.confirmation_token}"
      m1 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag1 => 'rails',:note => 'This is m1')
      m2 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag1 => 'rails',:note => 'This is m2')
      visit root_path
      click_link "Bookmarks!"
      page.should have_content "This is m1"
      click_link "Edit"
      page.should have_content "Edit This Bookmark"
      click_link "DELETE This Bookmark"
      if page.driver.browser.methods.include? :switch_to
        page.driver.browser.switch_to.alert.accept
      else
        assert true
      end
      page.should have_content "You deleted a Bookmark"

    end # it
  end # describe
end # describe
