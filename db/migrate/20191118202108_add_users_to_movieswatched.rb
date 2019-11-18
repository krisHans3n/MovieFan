class AddUsersToMovieswatched < ActiveRecord::Migration[6.0]
  def change
    add_reference :movieswatcheds, :users, foreign_key: true
  end
end
