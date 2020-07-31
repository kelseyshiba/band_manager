class RemoveCalendarIDfromGigs < ActiveRecord::Migration[6.0]
  def change
    remove_column :gigs, :calendar_id
  end
end
