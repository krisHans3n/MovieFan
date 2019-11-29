class Movieswatched < ApplicationRecord
belongs_to :movie#, optional: true
belongs_to :user#, optional: true

def newrecordlink(seenit)
    self.create(movies_id: seenit, users_id: "")
end


end
