class RenameStatustoStateGig < ActiveRecord::Migration[6.0]
  def change
    rename_column :gigs, :status, :gig_status
  end
end
