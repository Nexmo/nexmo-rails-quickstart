Rails.application.routes.draw do
  resource :outbound_sms, only: [:show, :create]
  resources :sms_delivery_receipts, only: [:create]
end
