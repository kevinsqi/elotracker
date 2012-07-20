class PagesController < ApplicationController

  INITIAL_NUM_PLAYER_FIELDS = 5
  def index
    @page_title = 'Custom competition ELO tracker'
    @league = League.new
    INITIAL_NUM_PLAYER_FIELDS.times do
      @league.players.build
    end
  end
end
