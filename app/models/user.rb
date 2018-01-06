class User < ApplicationRecord
  # entity associations
  has_many :flashcards, dependent: :destroy
  has_many :tags, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :login, presence: true, uniqueness: true
end
