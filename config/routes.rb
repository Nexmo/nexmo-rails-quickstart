Rails.application.routes.draw do
  resource :sms, only: [:show, :create]
  resources :delivery_receipts, only: [:create]
end
