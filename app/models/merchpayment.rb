class Merchpayment < ApplicationRecord
  belongs_to :users
  belongs_to :merchorders
end
