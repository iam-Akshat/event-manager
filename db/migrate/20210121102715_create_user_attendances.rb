class CreateUserAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :user_attendances do |t|
      t.column :attendee_id, :integer
      t.column :attended_event_id, :integer
      t.timestamps
    end
  end
end
