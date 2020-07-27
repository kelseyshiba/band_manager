class ChangeTypeGig < ActiveRecord::Migration[6.0]
  def change
    rename_column :gigs, :type, :gig_type
  end
end
