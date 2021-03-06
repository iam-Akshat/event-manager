class Event < ApplicationRecord
  validates :creator, presence: true
  validates :description, :date_of_event, presence: true

  scope :past, ->(current_date = Date.current) { where('date_of_event < ?', current_date) }
  scope :upcoming, ->(current_date = Date.current) { where('date_of_event > ?', current_date) }

  belongs_to :creator, class_name: 'User'
  has_many :user_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :user_attendances, source: :attendee
end
