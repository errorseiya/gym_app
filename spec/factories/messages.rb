FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    # ↑クラスメソッド定義して、system/users_spec.rbの

    # 添付する画像を定義する
    # image_path = Rails.root.join('public/images/test_image.png')で↑の”値”が帰ってくるイメージ

    # attachでつなげている
  end
end