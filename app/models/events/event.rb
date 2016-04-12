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

class Events::Event < ActiveRecord::Base
  default_scope -> {order("created_at asc")}

  belongs_to :user,
  class_name: "Users::User",
  foreign_key: "user_id",
  inverse_of: :events

  belongs_to :eventable,
  polymorphic: true

  validates :user_id,:title,:description,:location,
            :event_date,:event_time ,:eventable_type, presence: true

  validate  :event_date_and_time

  def event_date_and_time
     if event_date.present? && event_time.present?
        datetime = DateTime.parse("#{event_date} #{event_time}")
        if (datetime <= DateTime.now)
          errors[:base] << "Choose the future event date and event time ."
        end
     end
  end
end
