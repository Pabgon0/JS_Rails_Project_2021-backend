Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'current_user', to: 'current_user#index'
end
