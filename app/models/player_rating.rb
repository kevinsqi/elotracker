class PlayerRating < ActiveRecord::Base
  belongs_to :player
  attr_accessible :rating

  validates_presence_of :rating
  # TODO validate numericality of rating
end
