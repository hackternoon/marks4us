require "spec_helper"

describe UsrsController do
  describe "routing" do

    it "routes to #index" do
      get("/usrs").should route_to("usrs#index")
    end

    it "routes to #new" do
      get("/usrs/new").should route_to("usrs#new")
    end

    it "routes to #show" do
      get("/usrs/1").should route_to("usrs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/usrs/1/edit").should route_to("usrs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/usrs").should route_to("usrs#create")
    end

    it "routes to #update" do
      put("/usrs/1").should route_to("usrs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/usrs/1").should route_to("usrs#destroy", :id => "1")
    end

  end
end
