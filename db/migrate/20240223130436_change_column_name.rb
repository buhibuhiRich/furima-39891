class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :barth_date, :birth_date
  end
end
