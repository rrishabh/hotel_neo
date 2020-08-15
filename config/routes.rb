Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers
  get "/:hotel_id/available_rooms" => "bookings#available_rooms"
  post "/:hotel_id/check_in" => "bookings#check_in"
end
