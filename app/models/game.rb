class Game < ApplicationRecord
    enum game_type: {
        competitive: "competitive",
        cooperative: "cooperative",
        mixed: "mixed"
    }

    # has_many :recent_sessions, -> { order(played: :desc).limit(5) }, class_name: 'Session', through: 
    has_many :sessions

    include Games::PlayerStats
end
