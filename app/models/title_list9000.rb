class TitleList9000 < ApplicationRecord
has_one :movie, #optional: true
has_one :link, #optional: true

end
