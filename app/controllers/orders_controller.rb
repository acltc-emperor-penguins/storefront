class OrdersController < ApplicationController
  SALES_TAX = 0.09
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def create
    @carted_products = current_user.carted_products.where(status: "carted")

    #########TODO: move this stuff to models
    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end

    tax = subtotal * SALES_TAX
    total = subtotal + tax

    order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)

    redirect_to "/orders/#{order.id}"
  end
end
