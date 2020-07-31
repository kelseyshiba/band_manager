class ChangeGigStatusToBookingStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :gigs, :gig_status, :booking_status
  end
end
