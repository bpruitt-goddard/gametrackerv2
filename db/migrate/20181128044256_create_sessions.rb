class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.date :played
      t.string :notes
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
