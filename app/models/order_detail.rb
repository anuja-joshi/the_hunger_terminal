class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :terminal
  belongs_to :menu_item
  after_initialize :assign_menu_item_details, if: :menu_item

  def self.daily_orders
    self.
      joins(:order, :terminal).
      where("orders.date" => Date.today).
      group(:menu_item_name, "terminals.name, terminals.id").
      select("sum(quantity) as total_quantity, menu_item_name,
        terminals.name as terminal_name, terminals.id as t_id")
  end

  def assign_menu_item_details
    self.menu_item_name = menu_item.name
    self.menu_item_price = menu_item.price
    # veg = 
    self.terminal_name = menu_item.terminal.name
    self.terminal = menu_item.terminal
  end
end
