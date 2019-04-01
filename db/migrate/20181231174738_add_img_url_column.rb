class AddImgUrlColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :img_url, :string
  end
end
