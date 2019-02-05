class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.boolean :published
      t.string :author

      t.timestamps
    end
  end
end
