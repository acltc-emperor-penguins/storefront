class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :user

  SALES_TAX = 0.09

  def calculate_totals
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.subtotal
    end

    tax = subtotal * SALES_TAX
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end






end
