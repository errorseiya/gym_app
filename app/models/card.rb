class Card < ApplicationRecord
  belongs_to :user

  with_options numericality: { other_than: 0 } do
    validates :month_id
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :month
end
