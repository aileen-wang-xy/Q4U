class AddIsCollectedToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :is_collected, :boolean, default: false
  end
end
