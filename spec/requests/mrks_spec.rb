require 'spec_helper'

describe "Mrks" do
  describe "GET /mrks", :js => true do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit mrks_path
      # response.status.should be(200)
      page.should have_content "Book Marks!"
    end
  end
end
