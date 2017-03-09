class OrdersController < ApplicationController
  def new
    @current_user = User.last
    @order        = Order.new
    terminals_ids = Terminal.where(active: true, company: @current_user.company).ids
    @menu_items = MenuItem.where(terminal_id: terminals_ids, visibility: true)
  end

  def create
    p params
  end
end
