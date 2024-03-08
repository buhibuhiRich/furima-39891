class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :order, null: true, foreign_key: true
      t.string :postal_code, null: false
      t.integer :shipping_from_region_id, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end

