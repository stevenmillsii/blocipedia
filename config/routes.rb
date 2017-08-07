Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create] do
    post :downgrade, on: :collection
    post :admin, on: :collection
  end

  devise_for :users
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
