class League < ActiveRecord::Base
  attr_accessible :description, :is_completed, :is_public, :name
  attr_accessible :players_attributes  # TODO confirm safe

  has_many :players, :dependent => :destroy
  has_many :matches, :dependent => :destroy

  accepts_nested_attributes_for :players,
                                :allow_destroy => true,
                                :reject_if => lambda { |player| logger.debug player; player['name'].blank? }

  validates_presence_of :name
  validates :is_completed, :inclusion => {:in => [true, false]}
  validates :is_public, :inclusion => {:in => [true, false]}
end
