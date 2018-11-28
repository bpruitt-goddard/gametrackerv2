class CreateSessionPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :session_players do |t|
      t.decimal :score
      t.integer :placing
      t.string :team
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
