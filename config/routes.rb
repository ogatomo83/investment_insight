Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:new, :create]

  resources :stocks do
    collection do
      get 'edit_stocks'
      post 'save_edited_stocks'
      get 'stock_detail/:id', to: 'stocks#stock_detail', as: 'stock_detail'
    end
  end
end
