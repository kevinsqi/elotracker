class MovePlayerFieldsToPlayerRating < ActiveRecord::Migration
  def up
    remove_column :players, :k_factor
    remove_column :players, :is_professional
    add_column    :player_ratings, :k_factor, :integer
    add_column    :player_ratings, :is_professional, :boolean, :default => false
  end

  def down
    remove_column :player_ratings, :is_professional
    remove_column :player_ratings, :k_factor
    add_column    :players, :is_professional, :boolean, :default => false
    add_column    :players, :k_factor, :integer
  end
end
