class AddImagecontToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :imagecont, :string
  end
end
