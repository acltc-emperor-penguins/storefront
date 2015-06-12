class Order < ActiveRecord::Base

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
