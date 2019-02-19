class Session < ApplicationRecord
  belongs_to :game
  validates_associated :game

  has_many :session_players
  accepts_nested_attributes_for :session_players
  validates_presence_of :session_players
end
