class AddLoginColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :logged_in, :boolean
  end
end
