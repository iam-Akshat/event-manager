class User < ApplicationRecord

  validates :username, presence: true

  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :user_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :user_attendances, source: :attended_event
end
