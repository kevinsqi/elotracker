class Player < ActiveRecord::Base
  attr_accessible :is_professional, :k_factor, :name

  belongs_to :league
  has_many :matches

  # TODO make is_professional default => false
  validates_presence_of :is_professional
  validates_presence_of :k_factor
  validates_presence_of :name
end
