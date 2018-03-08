class Employee < ApplicationRecord
  validates :name, presence: true

  belongs_to :producer
end
