class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.integer :age

      t.timestamps
    end
  end
end
