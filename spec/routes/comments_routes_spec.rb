require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe " routes CommentsController" do

    it "routes to #index" do
      expect(:get => "/").to route_to("comments#index")
    end

    it "routes to #show" do
      expect(:get => "/comments/1").to route_to("comments#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/comments").to route_to("comments#create")
    end

  end
end