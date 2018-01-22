class RemoveFlashcardColumnImageFileSize < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :image_file_size, :integer
  end
end
