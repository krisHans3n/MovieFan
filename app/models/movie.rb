class Movie < ApplicationRecord
belongs_to :countries#, optional: true
belongs_to :merchandise#, optional: true

end
