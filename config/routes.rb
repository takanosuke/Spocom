Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'video#topPage'
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
end
