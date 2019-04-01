class AddScoreRow < ActiveRecord::Migration[5.2]
  def change
    remove_column :quotes, :sentiment, :float
    add_column :quotes, :score, :float
    add_column :quotes, :sentiment, :string
  end
end
