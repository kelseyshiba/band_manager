class RemoveSetListIdFromSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :set_list_id
  end
end
