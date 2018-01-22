class RemoveFlashcardColumnsForImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :image_file_name, :string
    
  end
end
