class Match < ActiveRecord::Base
  belongs_to :player_one, :class_name => 'Player', :foreign_key => 'player_one_id'
  belongs_to :player_two, :class_name => 'Player', :foreign_key => 'player_two_id'
  belongs_to :league

  attr_accessible :notes, :score
  attr_accessible :player_one, :player_one_id  # TODO safe?
  attr_accessible :player_two, :player_two_id  # TODO safe?

  validates_presence_of :player_one_id
  validates_presence_of :player_two_id
  validates_presence_of :score
  validate :players_are_different
  # TODO validate score between 0.0 and 1.0

  def players_are_different
    if player_one == player_two
      errors.add(:base, 'Players must be different')
    end
  end; private :players_are_different

  def rating_for_player(player)
    raise 'Invalid player for match' if ![player_one, player_two].include?(player)

    opponent = (player == player_one) ? player_two : player_one
    result   = (player == player_one) ? score      : (1.0 - score)

    Elo::Rating.new(
      :result       => result,
      :old_rating   => player.rating,
      :other_rating => opponent.rating,
      :k_factor     => player.k_factor
    ).new_rating
  end
end
