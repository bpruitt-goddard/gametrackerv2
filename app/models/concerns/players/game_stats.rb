module Players
    module GameStats
        extend ActiveSupport::Concern

        def best_game
            subquery = SessionPlayer.joins(:session)
                       .group('sessions.id, sessions.game_id')
                       .where('player_id = ?', id)
                       .select('sessions.game_id,
                          CASE MIN("placing") WHEN 1 THEN 1 ELSE 0 END as didWin ')

            # In win_percentage calculation, have to cast one operand to float to ensure float result
            query_result = Game.from(subquery)
                        .group('game_id')
                        .select('game_id,
                            sum(subquery.didWin) / count(*)::float as win_percentage,
                            count(*) as count,
                            sum(subquery.didWin) as win_count')
                        .order('win_percentage desc')
                        .first

            return to_percent(query_result)
        end

        private
            def to_percent (game_total)
                return nil unless game_total
                game_stats = GameWinPercent.new
                game_stats.win_percent = game_total.win_percentage
                game_stats.game = Game.find(game_total.game_id)
                return game_stats
            end
    end
end