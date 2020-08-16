class Api::BookingsController < ApplicationController

  def available_rooms
    @response = booking_service.available_rooms
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  def check_in
    @response = booking_service.checkin
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  def check_out
    @response = booking_service.checkout
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  private

  def booking_service
    BookingService.new(params)
  end
end