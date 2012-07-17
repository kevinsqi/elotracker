class League < ActiveRecord::Base
  attr_accessible :description, :is_completed, :is_public, :name

  has_many :players, :dependent => :destroy
  has_many :matches, :dependent => :destroy

  accepts_nested_attributes_for :players, :allow_destroy => true

  validates_presence_of :name
  validates_presence_of :is_completed
  validates_presence_of :is_public
end
