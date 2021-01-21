class Message < ApplicationRecord
  
  belongs_to :room
  belongs_to :user
  
  has_one_attached :image

  # validates :content, presence: true
  # 空の場合はDBに保存しないというバリデーションを設定

  # unlessはfalseのときにelseまでの処理が実行
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
    # attached?が画像があればtrue、なければfalseを判断して返している
    # これにより、画像が存在しなければテキストが必要となり、画像があればテキストは不要になる
  end

end
