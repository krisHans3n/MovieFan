class OrderItem < ApplicationRecord
  belongs_to :merchandise
  belongs_to :order
end
