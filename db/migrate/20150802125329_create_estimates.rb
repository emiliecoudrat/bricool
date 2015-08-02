class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.references :customer, index: true

      t.timestamps
    end
  end
end
