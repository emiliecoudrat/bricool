class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :day
      t.time :hour
      t.references :service, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
