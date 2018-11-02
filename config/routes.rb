Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'videos#top_page'
  resources :videos
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/payment/confirmention', to: 'payment#confirmention'
  get '/payment/pay', to: 'payment#pay'
end
