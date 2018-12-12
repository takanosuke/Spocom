Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'videos#top_page'
  resources :videos
  resources :line_users, :only => [:new, :create]
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/payment/confirmention/:video_id', to: 'payment#confirmention', as: :confirmention
  get '/payment/pay/:video_id', to: 'payment#pay', as: :pay
  get '/subscription_agreement/confirmention', to: 'subscription_agreement#confirmention', as: :renewal_confirmention
  get '/subscription_agreement/renewal', to: 'subscription_agreement#renewal', as: :renewal
  get '/subscription_agreement/expired_notification', to: 'subscription_agreement#expired_notification', as: :expired_notification

end
