class Movie < ApplicationRecord
belongs_to :countries, optional: true

end
