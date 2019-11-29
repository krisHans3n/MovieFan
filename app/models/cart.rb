class Cart < ApplicationRecord

    has_many :lineitems, dependent: :destroy

    def add_merch(merch)
        currentmerch = lineitems.find_by(merchandise_id: merch.id)

        if currentmerch == true
            currentmerch.increment(:quantity)
        else
            currentmerch = lineitems.build(merchandise_id: merch.id)
        end
        currentmerch
    end

    def totalprice
        lineitems.to_a.sum {|i| i.totalprice}
    end

end
