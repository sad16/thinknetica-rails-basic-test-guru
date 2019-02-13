Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users,
             controllers: { sessions: 'users/sessions' },
             path_names: { sign_in: :login, sign_out: :logout, sign_up: :singup }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
  end

  resources :gists, only: :create

  resource :feedback, only: [:new, :create], path_names: { new: '' }

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index
  end
end
