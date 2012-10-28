class PagesController < ApplicationController
  def index
    @page_title = 'Track anything with ELO'
    @league = League.new
  end
end
