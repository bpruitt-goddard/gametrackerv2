module Searches
    module SearchStats
        def search_stats
            connection = ActiveRecord::Base.connection()
            sql = %{
                SELECT count(*) as count,
                sum(case "placing"
                    when 1 then 1
                    else 0 end) as wins,
                    (sum(CASE "placing" WHEN 1 THEN 1 ELSE 0 END) / count(*)::float) as win_percentage
                FROM sessions
                LEFT JOIN session_players 
                ON sessions.id = session_players.session_id
                WHERE session_players.player_id = #{connection.quote(@player_id)}
                AND sessions.game_id = #{connection.quote(@game_id)}
            }
            results = connection.exec_query(sql)

            return nil unless results.any?
            
            player_game_stats = PlayerGameWinPercent.new
            player_game_stats.win_percent = results.first()['win_percentage']
            player_game_stats.play_count = results.first()['count']
            return player_game_stats
        end
    end
end
