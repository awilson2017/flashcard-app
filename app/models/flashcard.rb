class Flashcard < ApplicationRecord
  # entity associations
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  # validatioons
  validates :question, presence: true
  validates :answer, presence: true
end
