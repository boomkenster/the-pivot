class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :current_price
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
