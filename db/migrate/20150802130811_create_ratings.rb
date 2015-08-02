class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :average_mark
      t.text :comment
      t.references :bricooler, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
