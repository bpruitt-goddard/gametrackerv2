Sequel.migration do
  change do
    create_table(:games) do
      primary_key :id, unique: true
      String :name, null: false
      Integer :bgg_id, unique: true, null: false
      String :game_type, null: false
    end
  end
end
