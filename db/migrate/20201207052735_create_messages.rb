class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
      # ChatAppではテキストと画像の両方を投稿することができます。本章ではテキストの投稿機能のみを実装。
    end
  end
end
