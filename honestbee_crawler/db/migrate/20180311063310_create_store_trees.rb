class CreateStoreTrees < ActiveRecord::Migration
  def change
    create_table :store_trees do |t|
      t.string :page_title
      t.string :page_link
      t.integer :page_link_from

      t.timestamps null: false
    end
  end
end
