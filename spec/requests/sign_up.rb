require 'spec_helper'

describe "Sign Up Page" do
  describe "GET /users/sign_up", :js => false do
    it "Show me the Sign Up page" do
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
  end
end
