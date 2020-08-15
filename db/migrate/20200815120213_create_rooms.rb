class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.belongs_to :hotel
      t.string :number
      t.float :price
      t.string :room_type

      t.timestamps
    end
  end
end
