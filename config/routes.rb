Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
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

  # カテゴリー
  resources :categories, only: [:index, :show] do
    collection do
      get 'sub_category'
      get 'mini_category'
    end
  end
  
  # user周り
  resource :users, only: :show do
    resource :cards, only: [:new, :create, :show, :destroy]
    collection do
      get 'mypage'
      get 'card'=> 'cards#addcard'
    end
  end

  
end
