class AddJoinTableSetListSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :setlist_songs do |t|
      t.belongs_to :set_list, index: true
      t.belongs_to :song, index: true
      t.timestamps
    end
  end
end

