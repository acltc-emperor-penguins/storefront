class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    @tacos = Product.all
    if params[:sort] && params[:sort_order]
      @tacos = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount]
      @tacos = Product.where("price < ?", 2)
    end
    if params[:category]
      @tacos = Category.find_by(name: params[:category]).products
    end
  end

  def show
    if params[:id] == "random"
      tacos = Product.all
      @product = tacos.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description], rating: params[:rating])
    if @product.save
      flash[:success] = "Taco made!"
      redirect_to "/products/#{@product.id}"
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description], rating: params[:rating])
      flash[:success] = "This taco has been updated!"
      redirect_to "/products/#{@product.id}"
    else
      render :edit
    end
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
