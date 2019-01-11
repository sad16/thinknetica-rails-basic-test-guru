Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests, only: [:index, :show] do
    resources :questions, except: [:index, :show], shallow: true
  end
end
