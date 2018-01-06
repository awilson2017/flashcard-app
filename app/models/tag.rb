class Tag < ApplicationRecord
  # entity associations
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :flashcards, through: :taggings

  # TODO: validations - not sure I want this validation we shall see.
  # validates :name, presence: true, uniqueness: { scope: :user_id }
end
