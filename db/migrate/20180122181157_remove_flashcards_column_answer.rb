class RemoveFlashcardsColumnAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :answer
  end
end
