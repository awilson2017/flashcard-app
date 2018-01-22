class DropKoreanWord < ActiveRecord::Migration[5.1]
  def change
    remove_column :flashcards, :korean_word
  end
end
