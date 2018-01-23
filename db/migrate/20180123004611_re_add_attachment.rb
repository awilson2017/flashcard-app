class ReAddAttachment < ActiveRecord::Migration[5.1]
  def change
    add_attachment :flashcards, :image
  end
end
