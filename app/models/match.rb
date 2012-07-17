class Match < ActiveRecord::Base
  belongs_to :player_one, :class_name => 'User', :foreign_key => 'player_one_id'
  belongs_to :player_two, :class_name => 'User', :foreign_key => 'player_two_id'
  belongs_to :league
  attr_accessible :notes, :score

  validates_presence_of :score
  # TODO validate score between 0.0 and 1.0
end
