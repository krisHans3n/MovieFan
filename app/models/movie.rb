class Movie < ApplicationRecord
belongs_to :countries, optional: true
belongs_to :title_list9000, optional: true

end
