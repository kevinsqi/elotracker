class MatchObserver < ActiveRecord::Observer
  def after_create(model)
    model.player_one.add_match!(self)
    model.player_two.add_match!(self)
  end
end
