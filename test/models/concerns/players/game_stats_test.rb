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
end