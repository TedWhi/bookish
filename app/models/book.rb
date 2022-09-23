class Book < ApplicationRecord
  has_many :copies
  validates :Title, presence: true, length: {minimum: 1}
  validates :Author, presence: true, length: {minimum: 1 }
  validates :ISBN, presence: true, numericality: {only_integer: true }, length: {minimum: 5}
end
