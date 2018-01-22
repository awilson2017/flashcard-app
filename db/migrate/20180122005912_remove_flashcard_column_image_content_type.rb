class RemoveFlashcardColumnImageContentType < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :image_content_type, :string
  end
end
