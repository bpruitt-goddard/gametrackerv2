require 'test_helper'

class PlayerStatsTest < ActiveSupport::TestCase
    include GameCreationHelper, PlayerCreationHelper, SessionCreationHelper

    test "should return a player as best player" do
      game = create_game
      winning_player = create_player

      create_session(game, winning_players: [winning_player])

      assert_includes [winning_player], game.best_player.player
    end
end
