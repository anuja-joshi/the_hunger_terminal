class AddMenuItemToOrderDetail < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_details, :menu_item, foreign_key: true
  end
end
