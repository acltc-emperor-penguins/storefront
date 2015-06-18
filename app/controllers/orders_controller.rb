class OrdersController < ApplicationController
  before_action :authenticate_user!  
  
  def show
    @order = Order.find_by(id: params[:id])
    if @order.user_id != current_user.id
      redirect_to "/"
    end
  end

  def create
    @carted_products = current_user.carted_products.where(status: "carted")
    
    order = Order.create(user_id: current_user.id)
    @carted_products.update_all(status: "purchased", order_id: order.id)
    order.calculate_totals
    session[:cart_count] = current_user.carted_products.where(status: "carted").count

    redirect_to "/orders/#{order.id}"
  end
end
