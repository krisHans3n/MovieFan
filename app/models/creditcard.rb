class Creditcard < ApplicationRecord
  belongs_to :users
  validates :expdate, :number, :nameoncard, :organisationtype, presence: true
  

end
