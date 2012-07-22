# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

league = League.new(
  :name => 'Calvinball League 2011',
  :description => 'Panjiva Internal Calvinball League, Summer 2011'
)

league.players.build(:name => 'Jim')
league.players.build(:name => 'Brad')
league.players.build(:name => 'Shane')
league.players.build(:name => 'Tim')
league.save!

league.matches.create!(:player_one => league.players.find_by_name('Jim'), :player_two => league.players.find_by_name('Tim'), :score => 0.0)

