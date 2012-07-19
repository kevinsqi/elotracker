class PagesController < ApplicationController

  INITIAL_NUM_PLAYER_FIELDS = 5
  def index
    @page_title = 'Custom ELO tracker for any competition'
    @league = League.new
    INITIAL_NUM_PLAYER_FIELDS.times do
      @league.players.build
    end
  end
end
