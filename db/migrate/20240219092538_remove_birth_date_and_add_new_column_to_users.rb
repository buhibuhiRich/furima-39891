class RemoveBirthDateAndAddNewColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :birth_date
  end
end
