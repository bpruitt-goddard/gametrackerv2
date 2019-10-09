class Game < ApplicationRecord
    enum game_type: {
        competitive: "competitive",
        cooperative: "cooperative",
        mixed: "mixed"
    }

    has_many :sessions, -> {order 'played desc'}

    include Games::PlayerStats
end
