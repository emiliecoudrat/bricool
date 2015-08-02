class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_hour
      t.time :end_hour
      t.references :bricooler, index: true
      t.references :booking, index: true

      t.timestamps
    end
  end
end
