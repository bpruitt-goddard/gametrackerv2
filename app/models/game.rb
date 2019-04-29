class Game < ApplicationRecord
    enum game_type: {
        competitive: "competitive",
        cooperative: "cooperative",
        mixed: "mixed"
    }

    include Games::PlayerStats
end
