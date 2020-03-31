class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :rating, :decimal
    add_column :users, :contact_no, :string
  end
end
