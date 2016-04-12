require 'rails_helper'

RSpec.describe "events/events/show", :type => :view do
  before(:each) do
    @events_event = assign(:events_event, Events::Event.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
