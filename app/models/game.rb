class Game < ApplicationRecord
    enum game_type: {
        competitive: "competitive",
        cooperative: "cooperative",
        mixed: "mixed"
    }
end
