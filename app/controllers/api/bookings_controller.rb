class Api::BookingsController < ApplicationController
  before_action :find_hotel
  include Error::CustomHandler

  def available_rooms
    validate_required_field([:booking_date])
    @response = booking_service(__method__)
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  def booked_rooms
    validate_required_field([:booking_date])
    @response = booking_service(__method__)
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  def prior_booking
    validate_required_field([:room_id, :customer_id, :booking_date])
    @response = booking_service(__method__)
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  def checkin
    validate_required_field([:room_id, :customer_id])
    @response = booking_service(__method__)
    render json: { success: @response[:success] }
  end

  def checkout
    validate_required_field([:room_id, :customer_id])
    @response = booking_service(__method__)
    render json: { rooms: @response[:data], success: @response[:success] }
  end

  private

  def validate_required_field required_fields
    msg = []
    required_fields.each do |field|
      msg << ":#{field} should not be blank" if params[field.to_sym].blank?
    end
    raise Error::CustomError.new(:validation_error, 422, msg.join(",")) if msg.any?
  end

  def booking_service(method)
    BookingService.call(method, params, @hotel)
  end

  def find_hotel
    @hotel = Hotel.find_by(id: params[:hotel_id])
    raise Error::CustomError.new(:hotel_not_found, 404, "Hotel with ID: #{params[:hotel_id]} does not exist!") if @hotel.blank?
  end
end