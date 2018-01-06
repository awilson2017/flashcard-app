class User < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  has_many :tags
end