require 'test_helper'

class PlayerStatsTest < ActiveSupport::TestCase
    include GameCreationHelper, PlayerCreationHelper, SessionCreationHelper

    test "should return a player as best player" do
      game = create_game
      winning_player = create_player

      create_session(game, winning_players: [winning_player])

      assert_includes [winning_player], game.best_player.player
    end

    test "should return a player as worst player" do
      game = create_game
      losing_player = create_player
      winning_player = create_player

      create_session(game, winning_players: [winning_player], losing_players: [losing_player])

      assert_includes [losing_player], game.worst_player.player
    end
end
