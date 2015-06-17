class OrdersController < ApplicationController
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    
    redirect_to "/orders/#{order.id}"
  end
end
