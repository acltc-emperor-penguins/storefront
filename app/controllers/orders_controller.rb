class OrdersController < ApplicationController
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    quantity = params[:quantity].to_i
    price = Product.find_by(id: params[:product_id]).price

    order = Order.new(user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id])
    order.subtotal = order.calculate_subtotal(price)
    order.tax = order.calculate_tax(price)
    order.total = order.calculate_total(price)

    order.save
    redirect_to "/orders/#{order.id}"
  end
end
