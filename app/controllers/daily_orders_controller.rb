class DailyOrdersController < ApplicationController
  def index
    @daily_orders = OrderDetail.daily_orders
  end  
end
