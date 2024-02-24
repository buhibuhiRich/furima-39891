class RemoveBirthDateFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :date_of_birth, :date
    add_column :users, :birth_date, :date
  end
end
