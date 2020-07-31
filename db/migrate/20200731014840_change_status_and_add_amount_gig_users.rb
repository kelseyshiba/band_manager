class ChangeStatusAndAddAmountGigUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :gig_users, :status
    add_column :gig_users, :status, :string, default: "Pending"
    add_column :gig_users, :pay, :float
  end
end
