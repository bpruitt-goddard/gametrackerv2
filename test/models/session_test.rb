require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "should succeed when session is valid" do
    game = games(:one)
    session = Session.new(game: game)

    assert session.valid?
  end

  test "should fail when missing valid game" do
    session = Session.new(game_id: -1 )

    refute session.valid?
    assert_not_nil session.errors[:game]
  end
end
