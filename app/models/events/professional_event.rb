# == Schema Information
#
# Table name: events_events
#
#  id             :uuid             not null, primary key
#  title          :string(255)      not null
#  description    :text             not null
#  event_date     :date             not null
#  event_time     :time             not null
#  user_id        :uuid             not null
#  eventable_id   :uuid
#  eventable_type :string(255)      not null
#  location       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_events_events_on_eventable_id_and_eventable_type  (eventable_id,eventable_type)
#  index_events_events_on_user_id                          (user_id)
#

class Events::ProfessionalEvent < Events::Event
  self.table_name = 'events_events'
  scope :professional_events, -> { where :eventable_type => "ProfessionalEvent" }

  before_create :set_eventable_type

  def set_eventable_type
    self[:eventable_type] = "ProfessionalEvent"
  end
end
