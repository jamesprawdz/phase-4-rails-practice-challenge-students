class Student < ApplicationRecord
  belongs_to :instructor

  validates :name, presence: true
  validates :age, numericality: { minimum: 18 }
end
