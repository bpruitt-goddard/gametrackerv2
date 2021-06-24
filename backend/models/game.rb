class Game < Sequel::Model
    plugin :json_serializer
    plugin :validation_helpers

    def validate
      super
      validates_presence [:name, :bgg_id, :game_type]
      validates_includes ['mixed', 'competitive', 'cooperative'], :game_type
    end
end
