class RemoveAudioFileColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :audio_file
  end
end
