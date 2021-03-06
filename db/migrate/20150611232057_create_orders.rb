class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :tax, precision: 4, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.integer :quantity

      t.timestamps null: true
    end
  end
end
