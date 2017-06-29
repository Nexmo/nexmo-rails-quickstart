Rails.application.routes.draw do
  resources :outbound_sms,          only: [:index, :create]
  resources :sms_delivery_receipts, only: [:create]
  resources :inbound_sms,           only: [:create]
end
