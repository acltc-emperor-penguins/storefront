class ProductsController < ApplicationController

  def index
    @tacos = Product.all
    if params[:sort] && params[:sort_order]
      @tacos = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount]
      @tacos = Product.where("price < ?", 2)
    end
  end

  def show
    if params[:id] == "random"
      tacos = Product.all
      @taco = tacos.sample
    else
      @taco = Product.find_by(id: params[:id])
    end
  end

  def new
  end
  def create
    @taco = Product.create(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description], rating: params[:rating])
    flash[:success] = "Taco made!"
    redirect_to "/products/#{@taco.id}"
  end

  def edit
    @taco = Product.find_by(id: params[:id])
  end

  def update
    @taco = Product.find_by(id: params[:id])
    @taco.update(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description], rating: params[:rating])
    flash[:success] = "This taco has been updated!"
    redirect_to "/products/#{@taco.id}"
  end

  def destroy
    @taco = Product.find_by(id: params[:id])
    @taco.destroy
    flash[:warning] = "Taco destroyed!"
    redirect_to "/"
  end

  def search
    search_term = params[:search]
    @tacos = Product.where("name LIKE ? OR description LIKE ? OR image LIKE 
      ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render :index
  end


end
