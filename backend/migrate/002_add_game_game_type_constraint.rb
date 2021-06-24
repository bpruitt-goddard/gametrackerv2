Sequel.migration do
  change do
    extension :constraint_validations
    create_constraint_validations_table

    alter_table(:games) do
      validate do
        includes ['cooperative', 'competitive', 'mixed'], :game_type
      end
    end
  end
end
