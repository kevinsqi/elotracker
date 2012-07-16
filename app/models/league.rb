class League < ActiveRecord::Base
  attr_accessible :description, :is_completed, :is_public, :name
end
