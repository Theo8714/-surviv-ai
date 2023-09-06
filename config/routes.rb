Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: %i[show]
  resources :invoices, only: %i[index show new create edit update] do
    collection do
      get :archives
    end
  end

  post "incoming_invoice", to: "invoices#incoming_invoice"
end
