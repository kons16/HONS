class AddAuthToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :auth, :string
  end
end
