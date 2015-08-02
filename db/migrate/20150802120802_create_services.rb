class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.references :bricooler, index: true

      t.timestamps
    end
  end
end
