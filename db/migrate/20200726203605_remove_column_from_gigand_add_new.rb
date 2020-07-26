class RemoveColumnFromGigandAddNew < ActiveRecord::Migration[6.0]
  def change
    remove_column :gigs, :location
    add_column :gigs, :street_address, :string
    add_column :gigs, :secondary_address, :string
    add_column :gigs, :city, :string
    add_column :gigs, :state, :string
    add_column :gigs, :zip, :string
  end
end
