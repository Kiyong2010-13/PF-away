class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :customer_id
      t.integer :genre_id
      t.string :title, null: false, default: ""
      t.string :body, null: false, default: ""
      t.string :post_image_id

      t.timestamps
    end
  end
end
