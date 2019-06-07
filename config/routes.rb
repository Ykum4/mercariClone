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
  get 'mypage' => 'users#show'

end
