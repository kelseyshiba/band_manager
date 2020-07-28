class CreateGigsUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :gig_users
    create_table :gig_users do |t|
      t.belongs_to :gig, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
