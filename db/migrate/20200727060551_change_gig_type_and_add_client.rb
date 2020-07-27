class ChangeGigTypeAndAddClient < ActiveRecord::Migration[6.0]
  def change
    rename_column :gigs, :gig_type, :event_type
    add_column :gigs, :client, :string
  end
end
