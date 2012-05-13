require 'spec_helper'

describe "Permanent Accounts Page" do
  describe "GET /users/index", :js => true do
    it "Show me the Permanent Accounts Page" do
      "/users/index".should == get_users_index_path
      get get_users_index_path
      response.status.should be(200)
    end

  end
end
