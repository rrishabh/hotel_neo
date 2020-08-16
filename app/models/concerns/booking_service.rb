class BookingService
  attr_accessor :params, :hotel, :method

  def initialize(params, hotel)
    @params = params
    @hotel = hotel
  end

  def self.call(method, params, hotel)
    obj = new(params, hotel)
    obj.send(method)
  end

  def available_rooms
    booked_rooms = hotel.bookings.where(date_of_booking: params[:booking_date]).pluck(:room_id)
    available_rooms = Room.where.not(id: booked_rooms)
    success_response(available_rooms)
  end

  def booked_rooms
    booked_rooms = hotel.bookings.where(date_of_booking: params[:booking_date].to_date).pluck(:room_id)
    booked_rooms = Room.where(id: booked_rooms)
    success_response(booked_rooms)
  end

  def prior_booking
    @booking = Booking.where(room_id: params[:room_id], customer_id: params[:customer_id], hotel_id: hotel.id, date_of_booking: params[:booking_date].to_date).first_or_create
    success_response(@booking, "successfully booked the room")
  end

  def checkin
    @booking = Booking.where(room_id: params[:room_id], customer_id: params[:customer_id], hotel_id: hotel.id, date_of_booking: Time.current.to_date).first_or_create
    @booking.update(check_in: Time.current)
    success_response(@booking, "successfully checked in")
  end

  def checkout
    @booking = Booking.where.not(check_in: nil).where(room_id: params[:room_id], customer_id: params[:customer_id], hotel_id: hotel.id).first
    @booking.update(check_out: Time.now)
    success_response(@booking, "successfully checked out")
  end

  private

  def bookings
    Booking.where(room_id: params[:room_id], customer_id: params[:customer_id], hotel_id: hotel.id)
  end

  def success_response(data, message = "success")
    {
        data: data,
        message: message,
        success: true
    }
  end

  def failure_response(message)
    {
        data: nil,
        message: message,
        success: false
    }
  end
end