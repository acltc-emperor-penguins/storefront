class RemoveAttributesFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
  end
end
