class Product < ActiveRecord::Base
  SALES_TAX = 0.09

  def tax
    price * SALES_TAX
  end

  def total
    price + tax
  end
  
end
