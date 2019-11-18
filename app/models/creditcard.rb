class Creditcard < ApplicationRecord
  belongs_to :users
  validates :expdate, :number, :nameoncard, :organisationtype, presence: true
  enum organisation: {
      “American Express” => “AmericanExpress”,
      “Visa” => “Visa”,
      “MasterCard” => “MasterCard”
    }

end
