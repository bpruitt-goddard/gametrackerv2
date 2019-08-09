require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "should succeed when session is valid" do
    game = games(:one)
    session = Session.new(game: game, played: Date.new)
    player = session_players(:one)
    session.session_players << player

    assert session.valid?
  end

  test "should fail when missing valid game" do
    session = Session.new(game_id: -1 )

    refute session.valid?
    assert_not_nil session.errors[:game]
  end

  test "should fail when missing at least one player" do
    session = Session.new()
    session.session_players = Array.new
  
    refute session.valid?
    assert_not_empty session.errors[:session_players]
  end
end
