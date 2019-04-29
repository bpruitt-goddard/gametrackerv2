module SessionCreationHelper
    def create_session(game, winning_players: [], losing_players: [])
        session = Session.new(:game_id => game.id)
        session.played = Time.now
        
        winning_players.each do |winner|
            session_player = SessionPlayer.new(:session_id => session.id, :player_id => winner.id)
            session_player.placing = 1
            session.session_players.push(session_player)
        end

        losing_players.each do |loser|
            session_player = SessionPlayer.new(:session_id => session.id, :player_id => loser.id)
            session_player.placing = 2
            session.session_players.push(session_player)
        end

        session.save
    end
end