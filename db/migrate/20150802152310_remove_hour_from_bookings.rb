class RemoveHourFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :hour, :time
  end
end
