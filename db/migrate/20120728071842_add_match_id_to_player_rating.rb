class AddMatchIdToPlayerRating < ActiveRecord::Migration
  def change
    add_column :player_ratings, :match_id, :integer
  end
end
