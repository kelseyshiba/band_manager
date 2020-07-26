class CreateSetLists < ActiveRecord::Migration[6.0]
  def change
    create_table :set_lists do |t|
      t.references :gig
      t.timestamps
    end
  end
end
