require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session = sessions(:one)

    # Login
    user = users(:one)    
    post user_sessions_path, params: { email: user.email, password: default_password }    
  end

  test "should get index" do
    get sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should show session" do
    get session_url(@session)
    assert_response :success
  end

  test "should get edit" do
    get edit_session_url(@session)
    assert_response :success
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete session_url(@session)
    end

    assert_redirected_to sessions_url
  end

  test "should create session" do
    player_one = players(:one)

    session_params = {
      session: { 
          game_id: @session.game_id,
          session_players_attributes: [
            { player_id: player_one.id, score: 5, placing: 1}
          ] 
        }
    }

    assert_difference('Session.count') do
      assert_difference('SessionPlayer.count') do
        post sessions_url, params: session_params
      end
    end

    assert_redirected_to session_url(Session.last)
  end
end
