class Session < ApplicationRecord
  belongs_to :game
  validates_associated :game

  has_many :session_players
  validates_presence_of :session_players
end
