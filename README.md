# README

# アプリケーション名

ジム業務用アプリ


# アプリケーション概要
スポーツジム業務でのユーザー管理アプリケーションです。
管理者・会員ユーザーを登録し、互いに権限範囲内での情報の編集、削除（退会）が可能です。


# URL
実装次第追記

# テスト用アカウント
実装次第追記

# 利用方法
・未登録ユーザーはユーザー登録を行いましょう。
・管理者・会員ユーザーは、サインインしましょう。
・管理者ユーザーには会員リストが表示されるので、会員名を選択し詳細画面で編集、削除（退会）、メモ機能が使用できます。
・会員ユーザーは、登録した自身の詳細画面が表示されます。編集、削除（退会）機能が使用できます。

# 目指した課題解決
・編集画面に「メモ機能」を実装する事
・Payjpでサブスク機能（定期課金）を実装する
・Adminを使用しての管理者・会員の区別が作る


# 洗い出した要件
| 実装したい機能          | 要件                                              | 
| -------------------- | ------------------------------------------------- |
| 管理者と会員の管理機能   | 管理者ユーザーと会員ユーザーが登録/編集できるようにする為  |
| 会員情報の詳細表示機能   | 会員の登録した詳細データを取得できるようにする           |
| 会員の検索機能          | 管理者が会員を検索できるようにする                     |
| 会員情報の編集機能       | 会員情報の変更ができるようにする                       |
| メモ機能               | 管理者が詳細画面にメモを残せるよう実装                  |
| クレジットカード登録機能  | pay.jpを利用し会員コースの値段を定期課金できるようにする |
| 会員退会（削除）機能     | 会員の退会（削除）ができるようにする                   |

# 実装した機能についてのGIFと説明
実装次第追記

# 実装予定の機能
実装次第追記

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| admin              | boolean | null: false, default: false |
| name               | string  | null: false |
| name_kana          | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| subscription_id    | string  |             |
| premium            | boolean | null: false, default: false |


### Association
- has_many :cards, dependent: :destroy
- has_many :address, dependent: :destroy



## cards テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| customer_id     | string     | null: false       |
| card_id         | string     | null: false       |
| user            | references | foreign_key: true |


### Association
- belongs_to :user


## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| user           | references | foreign_key: true |

### Association
- belongs_to :user



# ローカルでの動作方法

クローンするアプリケーションを置きたいディレクトリに移動して下さい。

％ git clone 

クローンしたアプリケーションで使用するgemをインストールします。

％ bundle install

次にデーターベース作成をします。

％ rails db:create

％ rails db:migrate

％ rails db:seed

最後に

％ rails s

- railsのバージョン
Rails 6.0.0
- rubyのバージョン
ruby 2.6.5