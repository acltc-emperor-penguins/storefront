class CartedProductsController < ApplicationController
  def index
    if user_signed_in? && current_user.carted_products.where(status: "carted").any?
      @carted_products = current_user.carted_products.where(status: "carted")
    else
      flash[:warning] = "You have no items in your shopping cart. Waa waa."
      redirect_to "/"
    end
  end

  def create
    CartedProduct.create(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")
    redirect_to "/carted_products"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product removed"
    redirect_to "/carted_products"
  end
end
