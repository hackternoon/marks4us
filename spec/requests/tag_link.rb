require 'spec_helper'

describe "Tag Link" do
  describe "GET get_tag_link", :js => true do
    it "Show me a tag link for the rails tag" do
      # Create some bookmarks with 'rails' tags:

      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      m1 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag1 => 'rails',:note => 'This is m1')
      m2 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m2')

      m3 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m3')
      m4 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m4')

      m5 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m5')
      m6 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil,:tag2 => 'rails',:note => 'This is m6')

      visit get_tag_mrks_path('rails')
debugger
      page.should have_content "rails"
    end

  end
end
