class PlayerRating < ActiveRecord::Base
  DEFAULT_RATING = 1500
  DEFAULT_K_FACTOR = 15

  belongs_to :player
  attr_accessible :is_professional, :k_factor, :rating

  validates_presence_of :k_factor
  validates_presence_of :rating  # TODO validate numericality of rating
  validates :is_professional, :inclusion => {:in => [true, false]}

  after_initialize :default_values

  def default_values
    if self.new_record?
      self.rating ||= DEFAULT_RATING
      self.k_factor ||= DEFAULT_K_FACTOR
    end
  end; private :default_values
end
