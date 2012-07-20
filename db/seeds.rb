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
