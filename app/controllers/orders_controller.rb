class OrdersController < ApplicationController
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    order = Order.create(user_id: current_user.id, quantity: params[:quantity])
    redirect_to "/orders/#{order.id}"
  end
end
