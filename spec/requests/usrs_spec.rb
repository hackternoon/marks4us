require 'spec_helper'

describe "Usrs" do
  describe "GET /usrs", :js => true do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get usrs_path
      response.status.should be(200)
      visit usrs_path
      page.should have_content "bookmarks"
    end
  end
end
