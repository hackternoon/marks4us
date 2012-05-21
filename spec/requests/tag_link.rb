require 'spec_helper'

describe "Tag Link" do
  describe "GET get_tag_link", :js => false do
    it "Show me a tag link for the rails tag" do
      # Create some bookmarks with 'rails' tags:
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      m1 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag1 => 'rails',:note => 'This is m1')
      m2 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m2')
      m3 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m3')
      m4 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m4')
      m5 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag3 => 'rails',:note => 'This is m5')
      m6 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag3 => 'rails',:note => 'This is m6')
      m7 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag3 => 'rails////hello',:note => 'This is m7')
      visit get_tag_mrks_path('rails')
      page.should have_content "Bookmarks for the Tag: rails"
      click_link "bookmark+site"
      page.should have_content "Bookmarks for the Tag: bookmark+site"
      click_link "Bookmarks!"
      page.should have_content "rails_hello"
      click_link "rails_hello"
      page.should have_content "rails_hello"
    end # it
  end # describe
end # describe
