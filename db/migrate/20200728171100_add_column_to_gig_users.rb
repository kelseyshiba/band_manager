class AddColumnToGigUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :gig_users, :status, :string
  end
end
