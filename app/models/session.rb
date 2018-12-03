class Session < ApplicationRecord
  belongs_to :game
  validates_associated :game

  has_many :session_players
end
