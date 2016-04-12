require 'rails_helper'

RSpec.describe "events/events/edit", :type => :view do
  before(:each) do
    @events_event = assign(:events_event, Events::Event.create!())
  end

  it "renders the edit events_event form" do
    render

    assert_select "form[action=?][method=?]", events_event_path(@events_event), "post" do
    end
  end
end
