require 'spec_helper'

describe "Mrks" do
  describe "GET /mrks", :js => true do
    it "works! (now write some real specs)" do
      visit mrks_path
      page.should have_content "Book Marks!"
      @dan = FactoryGirl.create(:user, :email => 'dan@bot4.us')
      m1 = FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil)
      (10..99).each{|n| FactoryGirl.create(:mrk, :user_id => @dan.id, :usr_id => nil, :note => "note#{n}")}
      visit mrks_path
debugger
      page.should have_content "Book Marks!"
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

    end
  end
end
