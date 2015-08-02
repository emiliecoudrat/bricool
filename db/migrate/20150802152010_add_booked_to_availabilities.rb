class AddBookedToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :booked, :boolean
  end
end
