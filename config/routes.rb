Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_up', to: 'users/registrations#sign_up'
  end

end
