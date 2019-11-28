class Merchandise < ApplicationRecord
    has_many :merchorders
    has_one :stock
    has_one :movie
    belongs_to :user, optional: true 
    has_many :lineitems

    private

    def not_referenced_by_line
        unless lineitems.empty?
            errors.add(:base, 'there are items here')
            throw :abort
        end
    end

end
