class Licence < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :key,  presence: true
end
