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
  end
end
