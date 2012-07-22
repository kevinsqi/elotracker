class Player < ActiveRecord::Base
  DEFAULT_K_FACTOR = 15

  attr_accessible :is_professional, :k_factor, :name

  belongs_to :league
  has_many :matches
  has_many :player_ratings

  validates :is_professional, :inclusion => {:in => [true, false]}
  validates_presence_of :k_factor
  validates_presence_of :name
  validates_presence_of :player_rating
  validates_uniqueness_of :name, :scope => :league_id

  after_initialize :default_values

  def default_values
    if self.new_record?
      self.is_professional ||= false  # TODO make is_professional default => false in DB and remove this
      self.k_factor ||= DEFAULT_K_FACTOR
      self.player_rating ||= PlayerRating.new
    end
  end; private :default_values

  def add_match!(match)
    self.matches << match

    # TODO calculate new rating
    old_rating = self.player_rating.rating
    new_rating = old_rating
    self.player_ratings.create(:rating => new_rating)
  end

  def player_rating
    self.player_ratings.last
  end

  def player_rating=(rating)
    self.player_ratings << rating
  end
end
