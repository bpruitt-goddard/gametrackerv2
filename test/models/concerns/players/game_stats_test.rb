require 'test_helper'

class GameStatsTest < ActiveSupport::TestCase
    include GameCreationHelper, PlayerCreationHelper, SessionCreationHelper

    test "should return a game as best game" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player])

        best_game = player.best_game

        assert_equal game, best_game.game
        assert_equal 1, best_game.win_percent
    end

    test "should calculate win % correctly for best game" do
        player = create_player
        game = create_game()
        3.times { create_session(game, winning_players: [player]) }
        create_session(game, losing_players: [player])

        best_game = player.best_game

        assert_equal game, best_game.game
        assert_equal 0.75, best_game.win_percent
    end

    test "should choose an arbitrary game when tied for best game" do
        player = create_player
        game_one = create_game
        game_two = create_game ('other')
        create_session(game_one, winning_players: [player])
        create_session(game_two, winning_players: [player])

        best_game = player.best_game

        assert_includes [game_one, game_two], best_game.game
        assert_equal 1, best_game.win_percent
    end

    test "should choose best placing in game when playing as multiple players for best game" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player], losing_players: [player])

        best_game = player.best_game

        assert_equal game, best_game.game
        assert_equal 1, best_game.win_percent
    end

    test "should return a game as worst game" do
        player = create_player
        game = create_game
        create_session(game, losing_players: [player])

        worst_game = player.worst_game

        assert_equal game, worst_game.game
        assert_equal 0, worst_game.win_percent
    end

    test "should calculate win % correctly for worst game" do
        player = create_player
        game = create_game()
        3.times { create_session(game, losing_players: [player]) }
        create_session(game, winning_players: [player])

        worst_game = player.worst_game

        assert_equal game, worst_game.game
        assert_equal 0.25, worst_game.win_percent
    end

    test "should choose an arbitrary game when tied for worst game" do
        player = create_player
        game_one = create_game
        game_two = create_game ('other')
        create_session(game_one, losing_players: [player])
        create_session(game_two, losing_players: [player])

        worst_game = player.worst_game

        assert_includes [game_one, game_two], worst_game.game
        assert_equal 0, worst_game.win_percent
    end

    test "should choose worst placing in game when playing as multiple players for worst game" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player], losing_players: [player])

        worst_game = player.worst_game

        assert_equal game, worst_game.game
        assert_equal 0, worst_game.win_percent
    end
end