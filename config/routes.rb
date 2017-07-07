Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords'
  }
  root 'home#index'
  get '/admin', to: 'admins#index'
end
