class RemoveNullConstraintFromBuildingNameInShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    change_column_null :shipping_addresses, :building_name, true
  end
end
