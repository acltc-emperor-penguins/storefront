class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :products, through: :carted_products
  belongs_to :user

  def calculate_subtotal(price)
    quantity * price
  end

  def calculate_tax(price)
    quantity * price * 0.09
  end

  def calculate_total(price)
    quantity * price * 1.09
  end


end
