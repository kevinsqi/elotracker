class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.text :name
      t.text :description
      t.boolean :is_public,    :default => true
      t.boolean :is_completed, :default => false

      t.timestamps
    end
  end
end
