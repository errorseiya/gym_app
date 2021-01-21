class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      # テーブルで見るとカラム名がroom_id、user＿idになってる
      # ここに保存する「ユーザー」と「チャットグループ」は必ず存在している事が前提
      # 「usersテーブル」と「roomsテーブル」の情報を参照する必要がある
      # この参照する役割を果たすのが「foreign_key: true」
      
      t.timestamps
    end
  end
end
