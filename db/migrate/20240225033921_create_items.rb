class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_cost_responsibility_id
      t.integer :shipping_from_region_id
      t.integer :days_until_shipment_id
      t.boolean :sold_out, default: false 

      t.timestamps
    end
  end
end
