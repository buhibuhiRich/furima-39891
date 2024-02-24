class RemoveBirthDateAndAddNewColumnToUsers < ActiveRecord::Migration[7.0]
  def change
      change_column :users, :birth_date
  end    
end
