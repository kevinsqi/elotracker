class Player < ActiveRecord::Base
  attr_accessible :name

  belongs_to :league
  has_many :matches, :finder_sql => Proc.new { %Q{
    SELECT *
    FROM matches
    WHERE (matches.player_one_id = #{self.id}) OR (matches.player_two_id = #{self.id})
    ORDER BY matches.created_at
  }}
  has_many :player_ratings

  validates_presence_of :name
  validates_presence_of :player_rating
  validates_uniqueness_of :name, :scope => :league_id

  after_initialize :default_values

  delegate :is_professional, :k_factor, :rating, :rating_change, :to => :player_rating

  def default_values
    if self.new_record?
      self.player_rating ||= PlayerRating.new
    end
  end; private :default_values

  # TODO refactor
  # TODO error handling?
  def add_match!(match)
    self.matches << match
    self.player_ratings.create(
      :is_professional => self.is_professional,
      :k_factor        => self.k_factor,
      :rating          => match.create_rating_for_player(self),
      :match           => match
    )
  end

  def player_rating
    self.player_ratings.last
  end

  def player_rating=(rating)
    self.player_ratings << rating
  end
end
