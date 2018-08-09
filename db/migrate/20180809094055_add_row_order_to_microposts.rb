class AddRowOrderToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :row_order, :integer
  end
end
