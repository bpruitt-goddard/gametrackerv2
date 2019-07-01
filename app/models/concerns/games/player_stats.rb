module Games
    module PlayerStats
        extend ActiveSupport::Concern
      
      RESULT_COUNT = 3

      def best_players
        return game_totals.take(RESULT_COUNT).map{|game_total| to_stats(game_total)}
      end

      private
        def game_totals
          # Have to declare win_percentage because (wins / plays) doesn't work in ordering
          # In win_percentage calculation, have to cast one operand to float to ensure float result
          Session.joins(:session_players)
              .select('session_players.player_id,
                 count(*) as count,
                 sum(case "placing"
                    when 1 then 1
                    else 0 end) as wins,
                 (sum(CASE "placing" WHEN 1 THEN 1 ELSE 0 END) / count(*)::float) as win_percentage')
              .where('game_id = ?', id)
              .where('session_players.player_id > 0')
              .group('session_players.player_id')
              .order('win_percentage desc, count desc')
        end

        def to_stats (game_total)
          return nil unless game_total
          player_stats = PlayerWinPercent.new
          player_stats.win_percent = game_total.win_percentage
          player_stats.player = Player.find(game_total.player_id)
          player_stats.play_count = game_total.count
          return player_stats
        end
    end
end
