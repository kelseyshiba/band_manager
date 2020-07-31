class DeleteCalendars < ActiveRecord::Migration[6.0]
  def change
    drop_table :calendars
  end
end
