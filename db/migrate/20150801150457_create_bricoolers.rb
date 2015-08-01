class CreateBricoolers < ActiveRecord::Migration
  def change
    create_table :bricoolers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :zipcode
      t.string :city
      t.string :picture
      t.text :bio
      t.boolean :identity_verified
      t.boolean :licence_verified
      t.boolean :phone_verified
      t.boolean :email_verified
      t.string :iban
      t.string :bic
      t.boolean :tsandcs

      t.timestamps
    end
  end
end
