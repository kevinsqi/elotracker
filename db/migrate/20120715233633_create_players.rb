class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.text :name
      t.integer :k_factor
      t.boolean :is_professional
      t.references :league

      t.timestamps
    end
    add_index :players, :league_id
  end
end
