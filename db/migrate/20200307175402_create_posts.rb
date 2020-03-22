class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :service_type
      t.string :spot_name
      t.string :address
      t.integer :fee
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.string :contact_name
      t.string :contactno
      t.string :contact_email
      t.integer :constraint

      t.timestamps
    end
  end
end
