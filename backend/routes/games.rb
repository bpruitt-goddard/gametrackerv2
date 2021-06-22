class App
  hash_branch('games') do |r|
    r.is Integer do |id|
      @game = Game[id]

      r.get do
        @game.to_hash
      end

      # TODO: add delete here
    end

    r.get do
      Game.all
    end

    r.post do
      @game = Game.new(game_params(r))

      if @game.valid? && @game.save
        @game.to_hash
      else
        r.halt(400, @game.errors)
      end
    end
  end

  private
    def game_params(r)
      params = JSON.parse(r.body.read)
      {
        name: params['name'],
        bgg_id: params['bgg_id'],
        game_type: params['game_type']
      }
    end
end
