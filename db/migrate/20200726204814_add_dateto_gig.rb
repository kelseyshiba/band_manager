class AddDatetoGig < ActiveRecord::Migration[6.0]
  def change
    add_column :gigs, :start_time, :datetime
    add_column :gigs, :end_time, :datetime
  end
end
