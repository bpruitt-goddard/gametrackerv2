class App
  hash_branch('games') do |r|
    r.get do
      # @games = Game.all
      # @games.map(&:to_json)
      { message: 'you got the games'}
    end
  end
end
