class Player < ActiveRecord::Base
  DEFAULT_K_FACTOR = 15

  attr_accessible :is_professional, :k_factor, :name

  belongs_to :league
  has_many :matches
  has_one :player_rating

  validates :is_professional, :inclusion => {:in => [true, false]}
  validates_presence_of :k_factor
  validates_presence_of :name
  validates_presence_of :player_rating

  after_initialize :default_values

  def default_values
    if self.new_record?
      self.is_professional ||= false  # TODO make is_professional default => false in DB and remove this
      self.k_factor ||= DEFAULT_K_FACTOR
      self.player_rating ||= PlayerRating.new
    end
  end; private :default_values
end
