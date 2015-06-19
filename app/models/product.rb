class Product < ActiveRecord::Base
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :supplier

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  SALES_TAX = 0.09

  def tax
    price * SALES_TAX
  end

  def total
    price + tax
  end
  
end
