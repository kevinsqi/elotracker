class PlayerRating < ActiveRecord::Base
  DEFAULT_RATING = 1500

  belongs_to :player
  attr_accessible :rating

  validates_presence_of :rating
  # TODO validate numericality of rating

  after_initialize :default_values

  def default_values
    if self.new_record?
      self.rating ||= DEFAULT_RATING
    end
  end; private :default_values
end
