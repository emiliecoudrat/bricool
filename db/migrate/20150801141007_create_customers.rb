class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :picture

      t.timestamps
    end
  end
end
