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