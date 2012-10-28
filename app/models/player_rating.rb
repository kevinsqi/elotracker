# TODO track rating source in db (match, manual edit)
class PlayerRating < ActiveRecord::Base
  DEFAULT_RATING = 1500
  DEFAULT_K_FACTOR = 15

  belongs_to :match
  belongs_to :player
  attr_accessible :is_professional, :k_factor, :rating
  attr_accessible :match, :match_id  # TODO safe?

  validates_presence_of :k_factor
  validates_presence_of :rating
  validates_numericality_of :rating, :only_integer => true
  validates :is_professional, :inclusion => {:in => [true, false]}

  after_initialize :default_values

  def default_values
    if self.new_record?
      self.rating ||= DEFAULT_RATING
      self.k_factor ||= DEFAULT_K_FACTOR
    end
  end; private :default_values

  # TODO denormalize, save this info in model?
  # Returns an integer, or nil if there is no earlier rating to compare to
  def rating_change
    prev_rating = player.player_ratings.where('created_at < ?', self.created_at).order('created_at').limit(1).first
    return nil if !prev_rating
    self.rating - prev_rating.rating
  end
end
