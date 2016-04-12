require "rails_helper"

RSpec.describe Events::EventsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/events/events").to route_to("events/events#index")
    end

    it "routes to #new" do
      expect(:get => "/events/events/new").to route_to("events/events#new")
    end

    it "routes to #show" do
      expect(:get => "/events/events/1").to route_to("events/events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/events/events/1/edit").to route_to("events/events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/events/events").to route_to("events/events#create")
    end

    it "routes to #update" do
      expect(:put => "/events/events/1").to route_to("events/events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/events/events/1").to route_to("events/events#destroy", :id => "1")
    end

  end
end
