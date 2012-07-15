class Player < ActiveRecord::Base
  belongs_to :league
  has_one :player_rating
  attr_accessible :is_professional, :k_factor, :name
end
