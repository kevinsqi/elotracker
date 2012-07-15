class PlayerRating < ActiveRecord::Base
  belongs_to :player
  attr_accessible :rating
end
