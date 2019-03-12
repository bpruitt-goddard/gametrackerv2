class Session < ApplicationRecord
  belongs_to :game
  validates_associated :game

  has_many :session_players, inverse_of: :session
  accepts_nested_attributes_for :session_players,
                                allow_destroy: true
  validates_presence_of :session_players
end
