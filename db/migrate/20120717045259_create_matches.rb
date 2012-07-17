class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :player_one
      t.references :player_two
      t.decimal :score
      t.references :league
      t.text :notes

      t.timestamps
    end
    add_index :matches, :player_one_id
    add_index :matches, :player_two_id
    add_index :matches, :league_id
  end
end
