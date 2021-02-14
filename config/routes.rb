Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get  'cards', to: 'users/registrations#new_cardss'
    post 'cards', to: 'users/registrations#create_cards'
  end
  root to: 'cards#index'
  
  
  resources :cards, only:[:index, :new, :create,:destroy,:show] 

  
end

# get 'posts', to: 'posts#index'
# このルーティングは、「postsというパスに、GETメソッドでリクエストが送られてきたとき、
# postsコントローラーのindexアクションを呼び出す」という設定である