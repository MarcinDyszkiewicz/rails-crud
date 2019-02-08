Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    member do
      post :publish
    end

    collection do
      get :published
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
