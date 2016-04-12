require 'rails_helper'

RSpec.describe "events/events/new", :type => :view do
  before(:each) do
    assign(:events_event, Events::Event.new())
  end

  it "renders new events_event form" do
    render

    assert_select "form[action=?][method=?]", events_events_path, "post" do
    end
  end
end
