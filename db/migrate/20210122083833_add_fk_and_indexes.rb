class AddFkAndIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :user_attendances, :attendee_id
    add_index :user_attendances, :attended_event_id
    add_index :events, :creator_id
  end
end
