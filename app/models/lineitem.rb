class Lineitem < ApplicationRecord
  belongs_to :merchandise
  belongs_to :cart

  def total_price
    merchandises.price.to_i * quantity.to_i
  end


end
