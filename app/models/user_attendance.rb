class UserAttendance < ApplicationRecord

  validates :attendee,:attended_event,presence: true

  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
