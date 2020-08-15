class Hotel < ApplicationRecord
  has_many :bookings
  has_many :rooms
end