class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :creator, null: false
      t.references :collector, null: false
      t.references :post, null: false, foreign_key: true
      t.boolean :creator_rating, default: false, null: false
      t.boolean :collector_rating, default: false, null: false

      t.timestamps
    end
  end
end
