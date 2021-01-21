module SignInSupport
  def sign_in(user)
    visit root_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on("Log in")
    expect(current_path).to eq root_path
  end
end





# spec配下のテストファイルでsign_inメソッドを使用する準備が整えた
# rails_helper.rbファイルを開き二ヶ所変更


# # コメントアウトを外す
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# # 中略

# RSpec.configure do |config|
#   # 追記
#   config.include SignInSupport

#   # 中略