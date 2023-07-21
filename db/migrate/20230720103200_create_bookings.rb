class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.date :booking_date
      t.string :billing_address

      t.timestamps
    end
  end
end
