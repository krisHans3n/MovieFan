class Subscriptionpayment < ApplicationRecord
  belongs_to :users
  belongs_to :subplans
end
