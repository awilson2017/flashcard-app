class Flashcard < ApplicationRecord
  # entity associations
  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  # validatioons TODO:
  # validates :question, presence: true
  # validates :answer, presence: true

  # paperclip code
  # has_attached_file :image, styles: {
  #   thumb: "100x100>",
  #   small: "200x200>",
  #   medium: "300x300>",
  #   large: "500x500>"
  # }
  # validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpeg|jpg)/

end
