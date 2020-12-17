class SearchController < ApplicationController
  def index
    @games = Game.all
    @players = Player.all
  end

  def search
  end
end
