class AddSessionIdToSessionPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :session_players, :session, foreign_key: true
  end
end
