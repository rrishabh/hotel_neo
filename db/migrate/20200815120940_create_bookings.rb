class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :room
      t.belongs_to :customer
      t.belongs_to :hotel

      t.date       :date_of_booking
      t.datetime   :check_in
      t.datetime   :check_out

      t.timestamps
    end
  end
end
