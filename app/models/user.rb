require './lib/recommendation.rb'

class User < ApplicationRecord
    has_many :movieswatcheds
    has_many :orders_paids
    has_many :movies, through: :movieswatcheds
    has_one :address
    has_one :creditcard
    has_one :subscriptionpayment
    has_many :merchandises
    has_one :account
    has_one :confirmed_orders
    enum role: [:user, :admin]
    #after_initialize :set_default_role, :if => :new_record?

    validates :f_name,  presence: true, length:{maximum: 50 }
    VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 75 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6}

    include Recommendation

end
