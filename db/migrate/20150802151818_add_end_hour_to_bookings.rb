class AddEndHourToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :end_hour, :time
  end
end
