class AddReleaseToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :release, :string
  end
end
