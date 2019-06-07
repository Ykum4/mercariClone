Rails.application.routes.draw do
  root 'products#index'
  
  # sign_up, login周りのrouting
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#sign_up'
  end
  
  # user周り
  resource :users, only: :show do
    collection do
      get 'mypage'
      get 'card'=> 'users#addcard'
      get 'card/new' => 'users#cardNew'
      post 'card/create' => 'users#cardCreate'
    end
  end

  # get 'mypage' => 'users#show'
  # get 'card' => 'users#card'
  # post 'card/create' => 'users#cardCreate'
end
