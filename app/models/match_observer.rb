class MatchObserver < ActiveRecord::Observer
  def after_create(model)
    raise "Update stats"  # TODO
  end
end
