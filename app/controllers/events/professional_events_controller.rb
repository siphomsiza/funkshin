class Events::ProfessionalEventsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @page_name = "List of Professional events"
    if current_user.system_admin?
      @professional_events = Events::ProfessionalEvent.professional_events
    else
      @professional_events = current_user.professional_events
    end
  end

  def section_name
    'Professional Events'
  end

  def section
    'Professional Events'
  end

  def section_url
    events_professional_events_index_path()
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end

end
