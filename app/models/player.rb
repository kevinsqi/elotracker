class Player < ActiveRecord::Base
  belongs_to :league
  attr_accessible :is_professional, :k_factor, :name

  # TODO make is_professional default => false
  validates_presence_of :is_professional
  validates_presence_of :k_factor
  validates_presence_of :name
end
