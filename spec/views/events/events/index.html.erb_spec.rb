require 'rails_helper'

RSpec.describe "events/events/index", :type => :view do
  before(:each) do
    assign(:events_events, [
      Events::Event.create!(),
      Events::Event.create!()
    ])
  end

  it "renders a list of events/events" do
    render
  end
end
