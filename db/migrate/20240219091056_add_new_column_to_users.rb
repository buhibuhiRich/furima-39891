class AddNewColumnToUsers < ActiveRecord::Migration[7.0]
  def change
   
    add_column :users, :barth_date, :date  # 新しいカラムの追加（適切な型や名前に変更してください）

  end
end