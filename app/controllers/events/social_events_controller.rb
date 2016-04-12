class Events::SocialEventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @page_name = "List of Social events"
    if current_user.system_admin?
      @social_events = Events::SocialEvent.social_events
    else
      @social_events = current_user.social_events
    end
  end

  def section_name
    'Social events'
  end

  def section
    'Social events'
  end

  def section_url
    events_social_events_index_path()
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
