class SearchController < ApplicationController
  def search
    @games = Game.all
    @players = Player.all
    @params = search_params
    
    if @params[:player_id].present? && @params[:game_id].present? 
      @search_stats = Search.new(search_params).search_stats
    end
  end

  private
    def search_params
      params
        .permit(:player_id, :game_id)
    end
end
