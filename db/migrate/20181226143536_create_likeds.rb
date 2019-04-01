class CreateLikeds < ActiveRecord::Migration[5.2]
  def change
    create_table :likeds do |t|
     t.integer :user_id
     t.integer :quote_id
     t.timestamps
   end
  end
end
