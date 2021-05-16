class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string  :title,            null: false 
      t.text    :text,             null: false
      t.integer :category_id,      null: false 
      t.integer :status_id,        null: false 
      t.integer :shipping_id,       null: false 
      t.integer :shipping_area_id,  null: false
      t.integer :shipdate_id,      null: false 
      t.integer :price,            null: false
      t.integer :user_id,          null: false, foreign_key: true
    end
  end        
end
