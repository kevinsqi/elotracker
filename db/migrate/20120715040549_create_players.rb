class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.text :name
      t.integer :k_factor
      t.boolean :is_professional
      t.references :league
      t.references :player_rating

      t.timestamps
    end
    add_index :players, :league_id
    add_index :players, :player_rating_id
  end
end
