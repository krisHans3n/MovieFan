class ItemsPaid < ApplicationRecord
  belongs_to :merchandises
  belongs_to :orders_paids
end
