class AddMagnitudeToQuotes < ActiveRecord::Migration[5.2]
  def change
        add_column :quotes, :magnitude, :float
  end
end
