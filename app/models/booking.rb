class Booking < ApplicationRecord
  belongs_to :hotel
  belongs_to :customer
  belongs_to :room

  validates_uniqueness_of :room, scope: [:date_of_booking], message: lambda{ |x, y|
    "This Room: #{x.room.number} is already booked for Date: #{x.date_of_booking}, please choose another room/date"
  }
end