class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
     t.integer :author_id
     t.string :content
     t.float :sentiment
   end
  end
end
