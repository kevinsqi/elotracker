class League < ActiveRecord::Base
  attr_accessible :description, :is_completed, :is_public, :name
  attr_accessible :players_attributes  # TODO confirm safe
  attr_accessible :matches_attributes  # TODO confirm safe

  has_many :players, :dependent => :destroy
  has_many :matches, :dependent => :destroy

  accepts_nested_attributes_for :players,
                                :allow_destroy => true,
                                :reject_if => lambda { |player| logger.debug player; player['name'].blank? }
  accepts_nested_attributes_for :matches

  validates_presence_of :name
  validates :is_completed, :inclusion => {:in => [true, false]}  # TODO rename column to is_locked
  validates :is_public, :inclusion => {:in => [true, false]}

  def recent_matches
    matches.where("id IS NOT NULL").order("created_at DESC")
  end

  def players_by_rank
    players.where("id IS NOT NULL").includes(:player_rating).order("player_rating.rating DESC, player.name ASC")
  end
end
