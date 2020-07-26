class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :location
      t.text :production_schedule
      t.text :guest_list
      t.string :type
      t.string :status
      t.references :calendar
      t.timestamps
    end
  end
end
