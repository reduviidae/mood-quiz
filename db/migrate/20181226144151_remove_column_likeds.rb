# Realized I only need the created_at column

class RemoveColumnLikeds < ActiveRecord::Migration[5.2]
  def change
    remove_column :likeds, :updated_at, :datetime
  end
end
