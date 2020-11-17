Rails.application.routes.draw do
  resources :todolists do
    resources :todoitems do
      member do
        patch :complete
      end
    end
  end
  root 'todolists#index'
end
