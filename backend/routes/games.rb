class App
  hash_branch('games') do |r|
    r.get do
      Game.all
    end
  end
end
