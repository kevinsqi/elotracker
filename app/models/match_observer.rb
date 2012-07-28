class MatchObserver < ActiveRecord::Observer
  def after_create(model)
    model.player_one.add_match!(model)
    model.player_two.add_match!(model)
  end
end
