class Product < ActiveRecord::Base
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :supplier

  SALES_TAX = 0.09

  def tax
    price * SALES_TAX
  end

  def total
    price + tax
  end
  
end
