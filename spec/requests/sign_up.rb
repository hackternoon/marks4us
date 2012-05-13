require 'spec_helper'

describe "Sign Up Page" do
  describe "GET /users/sign_up", :js => true do
    it "Show me the User Sign Up form" do
      "/users/sign_up".should == new_user_registration_path
      get new_user_registration_path
      response.status.should be(200)
      get "/users/sign_up"
      response.status.should be(200)
      visit new_user_registration_path
      page.should have_content "Permanent Account Sign up"
      click_link "marks4.us"
      click_link "Sign Up"
      page.should have_content "Permanent Account Sign up"
      page.should have_content "OR ... Temporary (2 Month) Account Sign up"
      fill_in('user_email', :with => 'dan@bot4.us')
      fill_in('user_password', :with => 'abc123')
      fill_in('user_password_confirmation', :with => 'abc123')
      click_button 'Permanent Sign Up'
      page.should have_content "A message with a confirmation link has been sent to your email address"
      @dan = User.find_by_email 'dan@bot4.us'
      visit "/users/confirmation?confirmation_token=#{@dan.confirmation_token}"
      page.should have_content "Your account was successfully confirmed"
      @dan_confirmed = User.find_by_email 'dan@bot4.us'
      click_link "marks4.us"
      click_link "Sign Out"
      page.should have_content "Signed out successfully"
      # Do it again and look for an error due to duplicate e-mail:
      click_link "marks4.us"
      click_link "Sign Up"
      page.should have_content "Permanent Account Sign up"
      page.should have_content "OR ... Temporary (2 Month) Account Sign up"
      fill_in('user_email', :with => 'dan@bot4.us')
      fill_in('user_password', :with => 'abc123')
      fill_in('user_password_confirmation', :with => 'abc123')
      click_button 'Permanent Sign Up'
      page.should have_content "error"
      page.should have_content "Email has already been taken"
    end

    it "Show me the Usr Sign Up form" do
      visit new_user_registration_path
      fill_in('usr_name', :with => 'dan')
      fill_in('usr_password', :with => 'abc123')
      fill_in('usr_password_confirmation', :with => 'abc123')
      click_button '2 Month Sign Up'
      page.should have_content "Success!"
      page.should have_content "Now, memorize your password"
      click_link "marks4.us"
      click_link "Sign Up"
      fill_in('usr_name', :with => 'dan')
      fill_in('usr_password', :with => 'abc123')
      fill_in('usr_password_confirmation', :with => 'abc123')
      click_button '2 Month Sign Up'
      page.should have_content "error"
      page.should have_content "Name has already been taken"
      click_link "Sign In"
      fill_in('user_email', :with => 'dan')
      fill_in('user_password', :with => 'abc123')
      click_button 'Sign in'
      page.should have_content "You are now signed in"
      click_link "Sign Out"
      page.should have_content "You are ..."
      page.should have_content "Signed Out"
      
    end
  end
end
