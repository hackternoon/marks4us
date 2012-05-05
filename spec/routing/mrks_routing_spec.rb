require "spec_helper"

describe MrksController do
  describe "routing" do

    it "routes to #index" do
      get("/mrks").should route_to("mrks#index")
    end

    it "routes to #new" do
      get("/mrks/new").should route_to("mrks#new")
    end

    it "routes to #show" do
      get("/mrks/1").should route_to("mrks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mrks/1/edit").should route_to("mrks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mrks").should route_to("mrks#create")
    end

    it "routes to #update" do
      put("/mrks/1").should route_to("mrks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mrks/1").should route_to("mrks#destroy", :id => "1")
    end

  end
end
