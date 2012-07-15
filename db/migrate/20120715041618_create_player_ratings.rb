class CreatePlayerRatings < ActiveRecord::Migration
  def change
    create_table :player_ratings do |t|
      t.integer :rating
      t.references :player

      t.timestamps
    end
    add_index :player_ratings, :player_id
  end
end
