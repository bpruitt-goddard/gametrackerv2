class App
  hash_branch('games') do |r|
    r.get do
      { message: 'You got the game' }
    end
  end
end
