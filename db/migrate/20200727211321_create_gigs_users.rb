class CreateGigsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :gigs_users
    create_table :gigs_users do |t|

      t.timestamps
    end
  end
end
