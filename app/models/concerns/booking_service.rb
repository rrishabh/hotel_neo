class BookingService

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def available_rooms
    hotel = Hotel.find_by(id: params[:hotel_id])
    if hotel.present?
      booked_rooms = hotel.bookings.where(date_of_booking: params[:booking_date]).pluck(:room_id)
      available_rooms = Room.where.not(id: booked_rooms)
      success_response(available_rooms)
    else
      failure_response("hotel does not exist")
    end
  end

  def checkin
    @booking = Booking.where(room_id: params[:room_id], customer_id: @customer.id, date_of_booking: params[:booking_date]).first
    @booking.update_attributes(check_in: Time.now)
  end

  def checkout
    @booking = Booking.where(room_id: params[:room_id], customer_id: @customer.id).first
    @booking.update_attributes(check_out: Time.now)
  end

  private

  def success_response(data)
    {
        data: data,
        success: true
    }
  end

  def failure_response(message)
    {
        data: message,
        success: false
    }
  end
end