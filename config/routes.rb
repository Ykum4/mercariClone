Rails.application.routes.draw do
  root 'products#index'
  
  # sign_up, login周りのrouting
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#sign_up' # select ways to register user by main, facebook, google
  end

  # 商品
  resources :products
  
  # user周り
  resource :users, only: :show do
    resource :cards, only: [:new, :create, :show, :destroy]
    collection do
      get 'mypage'
      get 'card'=> 'cards#addcard'
    end
  end

  
end
