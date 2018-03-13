class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :product_price
      t.string :source_store

      t.timestamps null: false
    end
  end
end
