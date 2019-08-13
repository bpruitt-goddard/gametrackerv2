class SessionPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :session
  validates :placing, presence: true
end
