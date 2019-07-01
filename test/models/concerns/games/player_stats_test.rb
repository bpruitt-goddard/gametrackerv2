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
      assert_equal 1, best_player.play_count
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
      assert_equal 1, best_player.play_count
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
      assert_equal 2, best_player.play_count
    end
    
    test "should choose most played game when tied for best game" do
      game = create_game
      player_one = create_player
      player_two = create_player('other')
      create_session(game, winning_players: [player_one])
      create_session(game, winning_players: [player_two])
      create_session(game, winning_players: [player_two])

      best_players = game.best_players

      assert_equal 2, best_players.count
      best_player = best_players.first
      assert_equal player_two, best_player.player
      assert_equal 1, best_player.win_percent
      assert_equal 2, best_player.play_count
  end
end
