class SearchController < ApplicationController
    @games = Game.all
    @players = Player.all
  end

end
