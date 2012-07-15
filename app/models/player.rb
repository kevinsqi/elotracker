class Player < ActiveRecord::Base
  belongs_to :league
  attr_accessible :is_professional, :k_factor, :name
end
