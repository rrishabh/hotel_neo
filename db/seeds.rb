# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


h = Hotel.create(name: "Hilton Hotels", address: "Mumbai", mmobile: "1232131231")
h.rooms.create([{number: "H-001", price: "5500", room_type: "A"}, {number: "H-002", price: "6500", room_type: "B"},
                {number: "H-003", price: "7500", room_type: "C"}, {number: "H-004", price: "8500", room_type: "D"},
                {number: "H-005", price: "9500", room_type: "E"}, {number: "H-006", price: "10500", room_type: "F"}])

Customer.create([{name: "David", email: "david@neo.com", mobile: "7987898989"},
                 {name: "Sean", email: "sean@neo.com", mobile: "7987898988"},
                 {name: "Jared", email: "jared@neo.com", mobile: "7987898969"},
                 {name: "Clark", email: "clark@neo.com", mobile: "7987898980"}])


Booking.create([{customer_id: 1, room_id: 2, date_of_booking: Date.tomorrow},
                {customer_id: 2, room_id: 2, date_of_booking: Date.tomorrow + 1.day}])