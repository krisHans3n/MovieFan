class Merchandise < ApplicationRecord
    has_many :merchorders
    has_one :stock
    has_one :movie
end
