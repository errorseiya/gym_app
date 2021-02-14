class Address < ApplicationRecord
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-) or  please enter in half-width numbers"}
    # 全角、ハイフンなしと複数のerror内容がある場合はその両方の意味のerror文を作成する
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :phone_number
  end

  # 固定電話(10桁),携帯電話(11桁)の正規表現
  validates :phone_number, format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "is please enter in half-width numbers" }
end
