class AddTitleToSetList < ActiveRecord::Migration[6.0]
  def change
    add_column :set_lists, :title, :string
  end
end
