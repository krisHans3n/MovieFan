class Merchorder < ApplicationRecord
  belongs_to :merchandises
  belongs_to :orders
end
