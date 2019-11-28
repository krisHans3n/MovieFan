class Lineitem < ApplicationRecord
  belongs_to :merchandises
  belongs_to :cart

  def total_price
    merchandises.total_price.to_i * quantity.to_i
  end


end
