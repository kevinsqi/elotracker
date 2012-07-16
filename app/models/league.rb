class League < ActiveRecord::Base
  attr_accessible :description, :is_completed, :is_public, :name

  has_many :players, :dependent => :destroy

  accepts_nested_attributes_for :players, :allow_destroy => true
end
