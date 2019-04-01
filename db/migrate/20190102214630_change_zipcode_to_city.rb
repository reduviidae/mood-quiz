class ChangeZipcodeToCity < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :zipcode, :integer
    add_column :users, :city, :string
  end
end
