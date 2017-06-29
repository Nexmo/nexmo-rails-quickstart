Rails.application.routes.draw do
  # SMS routes
  resources :outbound_sms,          only: [:index, :create]
  resources :sms_delivery_receipts, only: [:create]
  resources :inbound_sms,           only: [:create]

  # Phone Call routes
  resources :outbound_calls, only: [:index, :create, :show]
  resources :call_events,    only: [:create]
  resources :inbound_calls,  only: [:create]
end
