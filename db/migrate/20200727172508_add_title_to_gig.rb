class AddTitleToGig < ActiveRecord::Migration[6.0]
  def change
    add_column :gigs, :title, :string
  end
end
