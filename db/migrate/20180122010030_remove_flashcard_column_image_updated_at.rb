class RemoveFlashcardColumnImageUpdatedAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :image_updated_at, :datetime
  end
end
