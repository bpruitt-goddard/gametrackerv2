json.extract! game, :id, :name, :bgg_id, :game_type, :created_at, :updated_at
json.url game_url(game, format: :json)
