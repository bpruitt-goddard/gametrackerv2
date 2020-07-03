module Players
    module GameStats
        extend ActiveSupport::Concern
        RESULT_COUNT = 3
        
        def best_games
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
                            count(*) as count')
                        .order('win_percentage desc, count desc')
                        .take(RESULT_COUNT)

            return query_result.map{|game_total| to_percent(game_total)}
        end

        def worst_games
            subquery = SessionPlayer.joins(:session)
                           .group('sessions.id, sessions.game_id')
                           .where('player_id = ?', id)
                           .select('sessions.game_id,
                              CASE MAX("placing") WHEN 1 THEN 1 ELSE 0 END as didWin ')
    
            # In win_percentage calculation, have to cast one operand to float to ensure float result
            query_result = Game.from(subquery)
                               .group('game_id')
                               .select('game_id,
                             sum(subquery.didWin) / count(*)::float as win_percentage,
                             count(*) as count')
                               .order('win_percentage asc, count desc')
                               .take(RESULT_COUNT)
    
            return query_result.map{|game_total| to_percent(game_total)}
        end

        def win_rate
            subquery = SessionPlayer.joins(:session)
                           .group('sessions.id')
                           .where('player_id = ?', id)
                           .select('CASE MIN("placing") WHEN 1 THEN 1 ELSE 0 END as didWin ')
    
            query_result = SessionPlayer
                .from(subquery)
                .select('sum(subquery.didWin) / count(*)::float as win_percent')
    
            return 0 if query_result.blank?
            return query_result.to_a[0]['win_percent'] ||= 0
        end

        def competitive_win_rate
            subquery = SessionPlayer.joins(:session)
                            .group('sessions.id')
                            .where('player_id = ?', id)
                            .where("sessions.game_id in 
                                (SELECT id from games g where g.game_type <> 'cooperative')")
                            .select('CASE MIN("placing") WHEN 1 THEN 1 ELSE 0 END as didWin ')
    
            query_result = SessionPlayer
                .from(subquery)
                .select('sum(subquery.didWin) / count(*)::float as win_percent')
    
            return 0 if query_result.blank?
            return query_result.to_a[0]['win_percent'] ||= 0
        end

        private
            def to_percent (game_total)
                return nil unless game_total
                game_stats = GameWinPercent.new
                game_stats.win_percent = game_total.win_percentage
                game_stats.game = Game.find(game_total.game_id)
                game_stats.play_count = game_total.count
                return game_stats
            end
    end
end