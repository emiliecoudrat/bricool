class AddStartHourToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :start_hour, :time
  end
end
