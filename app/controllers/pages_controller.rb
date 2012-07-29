class PagesController < ApplicationController
  def index
    @page_title = 'Custom competition ELO tracker'
    @league = League.new(:name => '2012 Boston Foosball League')  # TODO generate names
  end
end
