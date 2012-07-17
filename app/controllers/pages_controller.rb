class PagesController < ApplicationController
  def index
    @page_title = 'Custom ELO tracker for any competition'
    @league = League.new
    5.times do  # TODO named constant
      @league.players.build
    end
  end
end
