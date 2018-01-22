class RevomeAttachment < ActiveRecord::Migration[5.1]
  def down
    remove_attachment :flashcards, :image
  end
end
