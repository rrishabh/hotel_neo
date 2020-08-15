class Api::BookingsController < ApplicationController
  # doorkeeper_for :all

  def available_rooms
    @response = BookingService.new(params).available_rooms
    render json: { rooms: @response[:data], success: @response[:success] }
  end

end
