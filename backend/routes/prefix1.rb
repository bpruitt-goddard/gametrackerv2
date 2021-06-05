class GameTracker
  hash_routes.on 'prefix1' do |r|
    # set_view_subdir 'prefix1'
    r.get "world" do
      "hello world!"
    end
  end
end
