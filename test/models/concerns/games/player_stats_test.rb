require 'test_helper'

class PlayerStatsTest < ActiveSupport::TestCase
    include GameCreationHelper, PlayerCreationHelper, SessionCreationHelper

    test "should return a player as best player" do
      game = create_game
      winning_player = create_player
      create_session(game, winning_players: [winning_player])

      best_players = game.best_players

      assert_equal 1, best_players.count
      best_player = best_players.first
      assert_includes [winning_player], best_player.player
      assert_equal 1, best_player.win_percent
    end
    
    test "should return a player as best player when tied for best" do
      game = create_game
      winning_player1 = create_player
      winning_player2 = create_player
      create_session(game, winning_players: [winning_player1])
      create_session(game, winning_players: [winning_player2])

      best_players = game.best_players

      assert_equal 2, best_players.count
      best_player = best_players.first
      assert_includes [winning_player1, winning_player2], best_player.player
      assert_equal 1, best_player.win_percent
    end

    test "should ignore unknown player as best player" do
      game = create_game
      known_player = create_player
      unknown_player = players(:unknown)
      create_session(game, winning_players: [unknown_player, known_player])
      create_session(game, losing_players: [known_player])

      best_players = game.best_players

      assert_equal 1, best_players.count
      best_player = best_players.first
      assert_equal known_player, best_player.player
      assert_equal 0.5, best_player.win_percent
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

    # test "should return nil as worst player when all players are tied for stats" do
    #   game = create_game
    #   player1 = create_player
    #   player2 = create_player

    #   create_session(game, winning_players: [player1])
    #   create_session(game, winning_players: [player2])

    #   assert_nil game.worst_player
    # end

    test "should ignore unknown player as worst player" do
      game = create_game
      known_player = create_player
      best_player = create_player
      unknown_player = players(:unknown)

      create_session(game, losing_players: [unknown_player, known_player])
      create_session(game, winning_players: [known_player, best_player])

      assert_equal known_player, game.worst_player.player
      assert_equal 0.5, game.worst_player.win_percent
    end
end
