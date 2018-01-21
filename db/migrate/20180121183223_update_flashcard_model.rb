class UpdateFlashcardModel < ActiveRecord::Migration[5.1]
  def change
    add_column :flashcards, :korean_word, :string
    add_column :flashcards, :audio_file, :string
  end
end
