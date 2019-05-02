require 'test_helper'

class PlayerStatsTest < ActiveSupport::TestCase
    include GameCreationHelper, PlayerCreationHelper, SessionCreationHelper

    test "should return a player as best player" do
      game = create_game
      winning_player = create_player

      create_session(game, winning_players: [winning_player])

      assert_includes [winning_player], game.best_player.player
      assert_equal 1, game.best_player.win_percent
    end
    
    test "should return a player as best player when tied for best" do
      game = create_game
      winning_player1 = create_player
      winning_player2 = create_player

      create_session(game, winning_players: [winning_player1])
      create_session(game, winning_players: [winning_player2])

      assert_includes [winning_player1, winning_player2], game.best_player.player
      assert_equal 1, game.best_player.win_percent
    end

    test "should return a player as worst player" do
      game = create_game
      losing_player = create_player
      winning_player = create_player

      create_session(game, winning_players: [winning_player],
                     losing_players: [losing_player])

      assert_includes [losing_player], game.worst_player.player
      assert_equal 0, game.worst_player.win_percent
    end

    test "should return a player as worst player when tied for best" do
      game = create_game
      winning_player = create_player
      losing_player1 = create_player
      losing_player2 = create_player

      create_session(game, winning_players: [winning_player], 
                    losing_players: [losing_player1, losing_player2])

      assert_includes [losing_player1, losing_player2], game.worst_player.player
      assert_equal 0, game.worst_player.win_percent
    end

    test "should return nil as worst player when all players are tied for stats" do
      game = create_game
      player1 = create_player
      player2 = create_player

      create_session(game, winning_players: [player1])
      create_session(game, winning_players: [player2])

      assert_nil game.worst_player
    end
end
