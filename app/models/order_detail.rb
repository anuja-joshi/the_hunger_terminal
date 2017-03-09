class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :terminal

  def self.daily_orders
    self.
      joins(:order, :terminal).
      group(:menu_item_name, "terminals.name, terminals.id").
      select("sum(quantity) as total_quantity, menu_item_name,
        terminals.name as terminal_name, terminals.id as t_id")
  end
end
