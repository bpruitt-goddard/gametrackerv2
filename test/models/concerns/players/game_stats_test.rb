require 'test_helper'

class GameStatsTest < ActiveSupport::TestCase
    include GameCreationHelper, PlayerCreationHelper, SessionCreationHelper

    test "should return a game as best game" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player])

        best_games = player.best_games

        assert_equal 1, best_games.count
        best_game = best_games.first
        assert_equal game, best_game.game
        assert_equal 1, best_game.win_percent
        assert_equal 1, best_game.play_count
    end

    test "should return top 3 games for best game" do
        player = create_player
        game_one = create_game
        game_two = create_game('game_two')
        game_three = create_game('game_three')
        create_session(game_one, winning_players: [player])
        create_session(game_two, winning_players: [player])
        create_session(game_two, losing_players: [player])
        create_session(game_three, losing_players: [player])

        best_games = player.best_games

        assert_equal 3, best_games.count
        best_game = best_games.first
        assert_equal game_one, best_game.game
        assert_equal 1, best_game.win_percent
        assert_equal 1, best_game.play_count
        second_best = best_games[1]
        assert_equal game_two, second_best.game
        assert_equal 0.5, second_best.win_percent
        assert_equal 2, second_best.play_count
        third_best = best_games[2]
        assert_equal game_three, third_best.game
        assert_equal 0, third_best.win_percent
        assert_equal 1, third_best.play_count
    end

    test "should calculate win % correctly for best game" do
        player = create_player
        game = create_game()
        3.times { create_session(game, winning_players: [player]) }
        create_session(game, losing_players: [player])

        best_games = player.best_games

        assert_equal 1, best_games.count
        best_game = best_games.first
        assert_equal game, best_game.game
        assert_equal 0.75, best_game.win_percent
        assert_equal 4, best_game.play_count
    end

    test "should choose an arbitrary game when tied for best game" do
        player = create_player
        game_one = create_game
        game_two = create_game('other')
        create_session(game_one, winning_players: [player])
        create_session(game_two, winning_players: [player])

        best_games = player.best_games

        best_game = best_games.first
        assert_includes [game_one, game_two], best_game.game
        assert_equal 1, best_game.win_percent
        assert_equal 1, best_game.play_count
    end

    test "should choose most played game when tied for best game" do
        player = create_player
        game_one = create_game
        game_two = create_game('other')
        create_session(game_one, winning_players: [player])
        create_session(game_two, winning_players: [player])
        create_session(game_two, winning_players: [player])

        best_games = player.best_games

        best_game = best_games.first
        assert_equal game_two, best_game.game
        assert_equal 1, best_game.win_percent
        assert_equal 2, best_game.play_count
    end

    test "should choose best placing in game when playing as multiple players for best game" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player], losing_players: [player])

        best_games = player.best_games

        assert_equal 1, best_games.count
        best_game = best_games.first
        assert_equal game, best_game.game
        assert_equal 1, best_game.win_percent
        assert_equal 1, best_game.play_count
    end

    test "should return a game as worst game" do
        player = create_player
        game = create_game
        create_session(game, losing_players: [player])

        worst_games = player.worst_games

        assert_equal 1, worst_games.count
        worst_game = worst_games.first
        assert_equal game, worst_game.game
        assert_equal 0, worst_game.win_percent
        assert_equal 1, worst_game.play_count
    end

    test "should return top 3 games for worst game" do
        player = create_player
        game_one = create_game
        game_two = create_game('game_two')
        game_three = create_game('game_three')
        create_session(game_one, losing_players: [player])
        create_session(game_two, losing_players: [player])
        create_session(game_two, winning_players: [player])
        create_session(game_three, winning_players: [player])

        worst_games = player.worst_games

        assert_equal 3, worst_games.count
        worst_game = worst_games.first
        assert_equal game_one, worst_game.game
        assert_equal 0, worst_game.win_percent
        assert_equal 1, worst_game.play_count
        second_worst = worst_games[1]
        assert_equal game_two, second_worst.game
        assert_equal 0.5, second_worst.win_percent
        assert_equal 2, second_worst.play_count
        third_worst = worst_games[2]
        assert_equal game_three, third_worst.game
        assert_equal 1, third_worst.win_percent
        assert_equal 1, third_worst.play_count
    end


    test "should calculate win % correctly for worst game" do
        player = create_player
        game = create_game()
        3.times { create_session(game, losing_players: [player]) }
        create_session(game, winning_players: [player])

        worst_games = player.worst_games

        assert_equal 1, worst_games.count
        worst_game = worst_games.first
        assert_equal game, worst_game.game
        assert_equal 0.25, worst_game.win_percent
        assert_equal 4, worst_game.play_count
    end

    test "should choose an arbitrary game when tied for worst game" do
        player = create_player
        game_one = create_game
        game_two = create_game('other')
        create_session(game_one, losing_players: [player])
        create_session(game_two, losing_players: [player])

        worst_games = player.worst_games

        worst_game = worst_games.first
        assert_includes [game_one, game_two], worst_game.game
        assert_equal 0, worst_game.win_percent
        assert_equal 1, worst_game.play_count
    end

    test "should choose most played game when tied for worst game" do
        player = create_player
        game_one = create_game
        game_two = create_game('other')
        create_session(game_one, losing_players: [player])
        create_session(game_two, losing_players: [player])
        create_session(game_two, losing_players: [player])

        worst_games = player.worst_games

        worst_game = worst_games.first
        assert_equal game_two, worst_game.game
        assert_equal 0, worst_game.win_percent
        assert_equal 2, worst_game.play_count

    end

    test "should choose worst placing in game when playing as multiple players for worst game" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player], losing_players: [player])

        worst_games = player.worst_games

        assert_equal 1, worst_games.count
        worst_game = worst_games.first
        assert_equal game, worst_game.game
        assert_equal 0, worst_game.win_percent
        assert_equal 1, worst_game.play_count
    end

    test "should return 0 for win rate when no games have been played" do
        player = create_player

        win_rate = player.win_rate

        assert_equal 0, win_rate
    end

    test "should return 0 for win rate when no games have been won" do
        player = create_player
        game = create_game
        create_session(game, losing_players: [player])

        win_rate = player.win_rate

        assert_equal 0, win_rate
    end

    test "should return 1 for win rate when no games have been lost" do
        player = create_player
        game = create_game
        create_session(game, winning_players: [player])

        win_rate = player.win_rate

        assert_equal 1, win_rate
    end

    test "should calculate all sessions of a game for win rate" do
        player = create_player
        game = create_game
        create_session(game, losing_players: [player])
        create_session(game, winning_players: [player])

        win_rate = player.win_rate

        assert_equal 0.5, win_rate
    end

    test "should calculate all sessions for win rate" do
        player = create_player
        game_one = create_game
        game_two = create_game('game_two')
        create_session(game_one, losing_players: [player])
        create_session(game_two, winning_players: [player])

        win_rate = player.win_rate

        assert_equal 0.5, win_rate
    end

    test "should calculate win rate based upon best placing when playing multiple players" do
        player = create_player
        game = create_game
        create_session(game, losing_players: [player], winning_players: [player])

        win_rate = player.win_rate

        assert_equal 1, win_rate
    end
end