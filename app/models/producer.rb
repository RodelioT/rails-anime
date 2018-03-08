class Producer < ApplicationRecord
  validates :name, presence: true

  has_many :anime_producers
  has_many :animes, through: :anime_producers
end
