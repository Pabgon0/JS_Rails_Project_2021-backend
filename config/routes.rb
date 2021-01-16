Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
