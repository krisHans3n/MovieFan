class Movie < ApplicationRecord
belongs_to :countrie, optional: true
belongs_to :merchandise, optional: true

end
