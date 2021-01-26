class AddDateToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :date_of_event ,:datetime
  end
end
