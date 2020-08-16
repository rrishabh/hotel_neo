Rails.application.routes.draw do
  # devise_for :customers
  # use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :bookings do
      collection do
        get "/:hotel_id/available_rooms" => :available_rooms
        post "/:hotel_id/check_in" => :check_in
      end
    end

    resources :customers
  end
end
