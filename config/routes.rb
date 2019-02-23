Rails.application.routes.draw do
  # videos routes
  resources :videos do
    resources :comments
  end
  # users routes
  resources :line_users, :except => [:index, :destroy]
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # rooms routes
  resources :rooms
  get '/rooms/find/:id', to: 'rooms#find', as: :find_room  
  # payment routes
  get '/payment/confirmention/:video_id', to: 'payment#confirmention', as: :confirmention
  get '/payment/pay/:video_id', to: 'payment#pay', as: :pay
  # subscription agreement routes
  get '/subscription_agreement/confirmention', to: 'subscription_agreement#confirmention', as: :renewal_confirmention
  get '/subscription_agreement/renewal', to: 'subscription_agreement#renewal', as: :renewal
  get '/subscription_agreement/expired_notification', to: 'subscription_agreement#expired_notification', as: :expired_notification
  # supports routes
  get '/supports/terms', to: 'supports#terms'
  get '/supports/company', to: 'supports#company'
  get '/supports/contact', to: 'supports#contact'
  # root route
  root to: 'videos#top_page'
  # mounts
  mount ActionCable.server => '/cable'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
